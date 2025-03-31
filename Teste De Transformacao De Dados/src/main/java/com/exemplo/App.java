package com.exemplo;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import com.opencsv.CSVWriter;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class App {
    public static void main(String[] args) {
        String pdfFileName = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"; // Nome do PDF
        String csvPath = "Teste_Guilherme_Terra.csv"; // Nome do CSV
        String zipPath = "Teste_Guilherme_Terra.zip"; // Nome do ZIP

        try {
            // Remove arquivos antigos, se existirem
            deleteFileIfExists(csvPath);
            deleteFileIfExists(zipPath);

            // Extrai texto do PDF
            String extractedText = extractTextFromPDF(pdfFileName);

            // Converte para CSV e substitui abreviações
            convertTextToCSV(extractedText, csvPath);

            // Compacta o CSV em um ZIP
            compressToZip(csvPath, zipPath);

            // Valida se os arquivos foram criados corretamente
            validateFileExists(csvPath, "CSV");
            validateFileExists(zipPath, "ZIP");

            System.out.println("✅ Processo concluído! Arquivo ZIP gerado: " + zipPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String extractTextFromPDF(String pdfFileName) throws IOException {
        InputStream pdfStream = App.class.getClassLoader().getResourceAsStream(pdfFileName);

        if (pdfStream == null) {
            throw new FileNotFoundException("❌ Arquivo PDF não encontrado: " + pdfFileName);
        }

        try (PDDocument document = PDDocument.load(pdfStream)) {
            PDFTextStripper pdfStripper = new PDFTextStripper();
            return pdfStripper.getText(document);
        }
    }

    private static void convertTextToCSV(String text, String csvPath) throws IOException {
        try (CSVWriter writer = new CSVWriter(new FileWriter(csvPath))) {
            String[] lines = text.split("\n");
            for (String line : lines) {
                // Substituir abreviações
                line = line.replace("OD", "Odontológico").replace("AMB", "Ambulatorial");
                writer.writeNext(line.split("\\s+")); // Assume que os valores são separados por espaço
            }
        }
    }

    private static void compressToZip(String filePath, String zipPath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(zipPath);
             ZipOutputStream zos = new ZipOutputStream(fos);
             FileInputStream fis = new FileInputStream(new File(filePath))) {

            ZipEntry zipEntry = new ZipEntry(new File(filePath).getName());
            zos.putNextEntry(zipEntry);

            byte[] buffer = new byte[1024];
            int length;
            while ((length = fis.read(buffer)) >= 0) {
                zos.write(buffer, 0, length);
            }
        }
    }

    private static void deleteFileIfExists(String filePath) {
        File file = new File(filePath);
        if (file.exists()) {
            if (file.delete()) {
                System.out.println("🗑 Arquivo antigo deletado: " + filePath);
            } else {
                System.err.println("⚠️ Falha ao deletar: " + filePath);
            }
        }
    }

    private static void validateFileExists(String filePath, String fileType) {
        File file = new File(filePath);
        if (file.exists() && file.length() > 0) {
            System.out.println("✅ " + fileType + " criado com sucesso: " + filePath);
        } else {
            System.err.println("❌ Erro ao criar " + fileType + ": " + filePath);
        }
    }
}
