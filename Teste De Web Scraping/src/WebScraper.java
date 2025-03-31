import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class WebScraper {
    public static void main(String[] args) {
        try {
            String siteUrl = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos";
            Document doc = Jsoup.connect(siteUrl).get();

            // Lista para armazenar arquivos baixados
            List<String> downloadedFiles = new ArrayList<>();

            // Seleciona todos os links que terminam com .pdf
            Elements links = doc.select("a[href$=.pdf]");

            for (Element link : links) {
                String fileUrl = link.absUrl("href");

                // Verifica se o link contém "Anexo_I" ou "Anexo_II"
                if (fileUrl.contains("Anexo_I") || fileUrl.contains("Anexo_II")) {
                    String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);

                    // Exclui o arquivo se já existir
                    File file = new File(fileName);
                    if (file.exists()) {
                        file.delete();
                        System.out.println("Arquivo antigo deletado: " + fileName);
                    }

                    // Baixa o novo arquivo
                    System.out.println("Baixando: " + fileName);
                    downloadFile(fileUrl, fileName);
                    downloadedFiles.add(fileName);
                }
            }

            System.out.println("Download concluído!");

            // Compacta os arquivos baixados
            if (!downloadedFiles.isEmpty()) {
                String zipFileName = "AnexosCompactados.zip";
                ZipFiles.zipFiles(zipFileName, downloadedFiles);
                System.out.println("Arquivos compactados em: " + zipFileName);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Método para baixar o arquivo
    private static void downloadFile(String fileUrl, String fileName) {
        try (BufferedInputStream in = new BufferedInputStream(new URL(fileUrl).openStream());
             FileOutputStream fileOutputStream = new FileOutputStream(fileName)) {
            
            byte[] dataBuffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
                fileOutputStream.write(dataBuffer, 0, bytesRead);
            }

            System.out.println("Arquivo salvo: " + fileName);

        } catch (IOException e) {
            System.err.println("Erro ao baixar: " + fileUrl);
            e.printStackTrace();
        }
    }
}
