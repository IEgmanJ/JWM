package DB;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class CourseAuto {

	private SQLquery sq;
	private ArrayList<String[]> gradeInfo;
	private ArrayList<String[]> allCoursers;

	public CourseAuto(){
		sq = new SQLquery();
		gradeInfo = sq.reads("SELECT  g_name,g_mj_code FROM grades","g_name","g_mj_code");

		///把课程信息转换成二维数组，方便处理 ，第一维是所有的课程，第二维是课程的详细信息
		ArrayList<String[]> courserInfo= sq.reads("SELECT c_code ,c_name,c_period FROM courser","c_code","c_name","c_period");

		allCoursers = new ArrayList<String[]>();

		//所有课程添加至列
		System.out.println("开始添加课程");
		for(String[] courserInfoTmp : courserInfo){
			for(int i = Integer.parseInt(courserInfoTmp[2]); i > 0 ; i--){
				String[] tmp = {courserInfoTmp[0],courserInfoTmp[1]}; //课程代码，课程名称
				allCoursers.add(tmp);
				System.out.println("课程添加ing");
			}
		}
		System.out.println("课程添加完毕");
		System.out.println("课程数："+allCoursers.size());
	}
	
	public boolean clearAllCourserTable(){
		String sql = "UPDATE courser_table SET ct_12 = '',ct_34 = '' ,ct_56 = '' ,ct_78 = ''";
		//排课前须将原有课程信息清空
		return sq.write(sql);
	}
	
	
	public String[] paike(){
		String[] Info = new String[2];
		String dateStart = DateFormat.getDateInstance().format(new Date());;
		System.out.println("开始课程添加至数据库中");
		for(String[] grade : gradeInfo){
			String[][] sortedCourserArray = randomSortCourse(allCoursers.toArray(new String[0][0]));
			int week = 1;	//周一到周五
			int n = 1;	//12 34 56 78  每天四节课
			for(String[] tmp:sortedCourserArray){
				System.out.println("写入之前课程数："+sortedCourserArray.length);
				String sql="";
				switch(n){
				case 1:
					sql = "UPDATE courser_table SET ct_12='"+tmp[0]+"' WHERE ct_weeks='"+week+"' AND ct_g_mj_code='"+grade[1]+"'";
					n++;
					break;
				case 2:
					sql = "UPDATE courser_table SET ct_34='"+tmp[0]+"' WHERE ct_weeks='"+week+"' AND ct_g_mj_code='"+grade[1]+"'";
					n++;
					break;
				case 3:
					sql = "UPDATE courser_table SET ct_56='"+tmp[0]+"' WHERE ct_weeks='"+week+"' AND ct_g_mj_code='"+grade[1]+"'";
					n++;
					break;
				case 4:
					sql = "UPDATE courser_table SET ct_78='"+tmp[0]+"' WHERE ct_weeks='"+week+"' AND ct_g_mj_code='"+grade[1]+"'";
					n=1;
					week++;
					break;
				}
				System.out.println("课程添加至数据库ing");
				sq.write(sql);
			}
		}
		System.out.println("课程添加至数据库完毕");
		sq.close();
		String dateEnd = DateFormat.getDateInstance().format(new Date());
		Info[0] = dateStart;
		Info[1] = dateEnd;
		return Info;
	}

	public String[][] randomSortCourse(String[][] allCourserArray){
		//随机排列所有课程
		System.out.println("排序之前课程数："+allCourserArray.length);
		System.out.println("开始随机排序课程");
		for(int i = 0 ; i < allCourserArray.length ; i++){
			int index = new Random().nextInt(allCourserArray.length-i)+i;
			String[] tmp = allCourserArray[i];
			allCourserArray[i] =allCourserArray[index];
			allCourserArray[index] = tmp;
			System.out.println("课程随机排序中");
		}
		System.out.println("课程随机排序完毕");
		System.out.println("排序之后课程数："+allCourserArray.length);
		//按班级添加至数据库
		return allCourserArray;
	}
}