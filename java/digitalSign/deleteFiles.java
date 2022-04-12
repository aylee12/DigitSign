package digitalSign;
import java.io.File;

public class deleteFiles {
	public void deleteFile (String filepath) {
		File path = new File(filepath);
		File[] fileList = path.listFiles();
		for (int i = 0; i < fileList.length; i++) {
			if (!fileList[i].delete()) {
				System.out.println("삭제 실패");
			}
		}
	}

}
