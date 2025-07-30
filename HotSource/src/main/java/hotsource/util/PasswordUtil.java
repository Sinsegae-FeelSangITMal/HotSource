package hotsource.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

import org.springframework.stereotype.Component;

import hotsource.exception.PasswordEncryptException;

@Component
public class PasswordUtil {

	public static String generateSalt() {
		
		SecureRandom sr = new SecureRandom();
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		
		return Base64.getEncoder().encodeToString(salt);
	}
	
	public static String hashPassword(String password, String salt) throws PasswordEncryptException{
		
		String result = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt.getBytes("UTF-8"));
			byte[] hashedByte = md.digest(password.getBytes("UTF-8"));
			
			result = Base64.getEncoder().encodeToString(hashedByte);
		} catch(Exception e) {
			e.printStackTrace();
			throw new PasswordEncryptException("암호화 실패", e);
		}
		return result;
	}
	
}
