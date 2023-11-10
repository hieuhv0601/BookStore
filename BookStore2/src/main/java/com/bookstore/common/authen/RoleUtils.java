package com.bookstore.common.authen;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.security.SecureRandom;
import java.util.Base64;

public class RoleUtils {

    // Generate a secret key for encryption (you should store this securely)
    private static SecretKey secretKey;

    static {
        try {
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            SecureRandom secureRandom = new SecureRandom();
            keyGen.init(256, secureRandom);
            secretKey = keyGen.generateKey();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Encrypt the role before storing it in the session
    public static void setEncryptedRoleInSession(HttpSession session, String role) {
        if (isValidRole(role)) {
            try {
                Cipher cipher = Cipher.getInstance("AES");
                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                byte[] encryptedRole = cipher.doFinal(role.getBytes());
                String encryptedRoleBase64 = Base64.getEncoder().encodeToString(encryptedRole);
                session.setAttribute("userRole", encryptedRoleBase64);
            } catch (Exception e) {
                // Handle encryption errors
            }
        } else {
            // Handle invalid role, possibly log an error or take appropriate action
        }
    }

    // Decrypt and retrieve the user's role from the session
    public static String getDecryptedRoleFromSession(HttpServletRequest request) throws ServletException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String encryptedRoleBase64 = (String) session.getAttribute("userRole");
            if (encryptedRoleBase64 != null) {
                try {
                    Cipher cipher = Cipher.getInstance("AES");
                    cipher.init(Cipher.DECRYPT_MODE, secretKey);
                    byte[] encryptedRole = Base64.getDecoder().decode(encryptedRoleBase64);
                    byte[] decryptedRoleBytes = cipher.doFinal(encryptedRole);
                    return new String(decryptedRoleBytes);
                } catch (Exception e) {
                    throw new ServletException("Failed to decrypt role.");
                }
            } else {
                throw new ServletException("Role not found in session.");
            }
        } else {
            throw new ServletException("Session not found or expired.");
        }
    }

    // Placeholder for role validation logic
    private static boolean isValidRole(String role) {
        return "admin".equals(role) || "customer".equals(role);
    }
}
