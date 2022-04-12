package digitalSign;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;

public class DigitSign {
	public void sign(File dataFile, File privatekeyFile, String path) 
			throws Exception {
		final String signAlgorithm = "SHA1withRSA";
		MyKeyPair keyPair = new MyKeyPair();
		PrivateKey privateKey = keyPair.getPrivatecKeyFromFile(privatekeyFile);
		byte[] data = Files.readAllBytes(dataFile.toPath());
		
		Signature sig = Signature.getInstance(signAlgorithm);
		sig.initSign(privateKey);
		sig.update(data);
		byte[] signature = sig.sign();
		
		FileOutputStream sigfos = new FileOutputStream(path + "/sig");
		sigfos.write(signature);
		sigfos.close();
	}
	
	public boolean verify(File dataFile, File sigFile, File publicKeyFile) 
			throws Exception {
		final String signAlgorithm = "SHA1withRSA";
		MyKeyPair keyPair = new MyKeyPair();
		PublicKey publicKey = keyPair.getPublicKeyFromFile(publicKeyFile);
		byte[] data = Files.readAllBytes(dataFile.toPath());
		byte[] signature = Files.readAllBytes(sigFile.toPath());
		
		Signature sig = Signature.getInstance(signAlgorithm);
		sig.initVerify(publicKey);
		sig.update(data);
		boolean rslt = sig.verify(signature);
		
		return rslt;
	}
}
