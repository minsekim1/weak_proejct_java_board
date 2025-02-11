import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.security.SecureRandom;
import java.util.Base64;

public class SecureEncryption {
    
    // AES 암호화 함수
    public static String encrypt(String data, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedData = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedData);
    }

    // AES 복호화 함수
    public static String decrypt(String encryptedData, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decodedData = Base64.getDecoder().decode(encryptedData);
        byte[] decryptedData = cipher.doFinal(decodedData);
        return new String(decryptedData);
    }

    // 보안적 난수 생성 함수
    public static int generateSecureRandomKey() {
        SecureRandom secureRandom = new SecureRandom();
        return secureRandom.nextInt(256); // 0~255 범위의 난수 반환
    }

    public static void main(String[] args) {
        try {
            // AES 키 생성
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            keyGen.init(128); // 128비트 AES 키 사용
            SecretKey secretKey = keyGen.generateKey();

            // 암호화 테스트 데이터
            String message = "Hello, World!";
            System.out.println("Original message: " + message);

            // 메시지 암호화
            String encryptedMessage = encrypt(message, secretKey);
            System.out.println("Encrypted message: " + encryptedMessage);

            // 메시지 복호화
            String decryptedMessage = decrypt(encryptedMessage, secretKey);
            System.out.println("Decrypted message: " + decryptedMessage);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
