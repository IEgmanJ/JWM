package DB;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;


public class BackUp {       

	private String str = null;       

	public void del(String path){
		File dir = new File(path);
		File[] files = dir.listFiles();
		for(File tmp : files){
			if(tmp.isDirectory()){
				del(tmp.getAbsolutePath());
			}else{
				tmp.delete();
			}
		}
	}
	
	public  boolean backup(String backupPath){
		//使用mysqldump来备份数据库，格式"mysqldump -u username -ppassword --opt database_name > direction/backup_name.sql"
		//用上面的方式会报错
		//mysqldump --no-defaults -u root -p wlan> D:\wlan.sql

		String time = DateFormat.getDateInstance().format(new Date());

		String fileName = "BackUp_"+time+"_"+(int)(Math.random()*1000)+".sql";

		str= "mysqldump --no-defaults -u root -proot JWM > " + backupPath + "\\"+fileName;  //执行exec必须使用绝对路径
		try {  
			Runtime rt=Runtime.getRuntime();
			System.out.println(str);
			rt.exec("cmd /c"+str);
			return true;
		} catch (IOException e) {  
			e.printStackTrace();
			return false;
		}  
	}

	public  boolean load(String backupFilePath){
		str="mysql -u root -proot JWM  < " + backupFilePath;
		// mysql命令可以实现数据库的还原。格式"mysql -u username  -ppassword   database_name     <     back_up_dir  "
		Runtime rt=Runtime.getRuntime();
		try {
			rt.exec("cmd /c"+str);
			System.out.println(str);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList<String[]> refreshFileList(String strPath) { 

		ArrayList<String[]> filelist = new ArrayList<String[]>(); 

		File dir = new File(strPath); 

		File[] files = dir.listFiles(); 

		if (files == null) 
			return null; 
		for (int i = 0; i < files.length; i++) { 
			if (files[i].isDirectory()) { 
				refreshFileList(files[i].getAbsolutePath()); 
			} else { 
				String tmp[] = {"",""};
				tmp[0] = files[i].getAbsolutePath(); //文件路径
				tmp[1] = files[i].getName();

				System.out.println("---"+tmp[0]+"\t"+tmp[1]);
				filelist.add(tmp);                    
			} 
		}

		return filelist;
	}
}
