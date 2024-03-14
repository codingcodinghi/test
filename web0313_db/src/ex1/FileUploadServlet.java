package ex1;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.GalleryDaoImpl;
import dao.GalleryDaoInter;
import vo.GalleryVO;


@WebServlet(name="/FileUpload", urlPatterns="/gallery/FileUpload")
//@MultipartConfig : enctype="multipart/form-data" �� ���  �߰� �Ұ�!
@MultipartConfig(fileSizeThreshold = 1024 * 1024, 
maxFileSize = 5 * 1024 * 1024,
maxRequestSize = 5 * 5 * 1024 * 1024)

public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String path ="";
    
    public FileUploadServlet() {
    	path = "D:\\ICTEDU\\springMVC\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\web0313_db\\resources\\img\\";
    		
        // ��ΰ� ������ ����� �ֱ�!
    	File f = new File(path);
    	if(!f.exists()) {
    		f.mkdirs();
    	}
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("Get ��� ȣ��");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		
		int price=Integer.parseInt(request.getParameter("price"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		String comm= request.getParameter("comm");
		String reip= "127.0.0.1";		
		
		Part part = request.getPart("fileName");
		String fName = getFileName(part);
		System.out.println("fName:" + path + fName);
		String[] imgTag =fName.split("\\.");
		long st =System.currentTimeMillis();
		fName = st +imgTag[1];
		
		if(!fName.isEmpty()) {
			//���� ������ġ�� output�Ѵ�
			part.write(path + fName);
		}
		
		/*
		PrintWriter out = response.getWriter();
		// ���� �ۼ���
        String fileWriter = request.getParameter("fileWriter");
        // ���� ����
        String fileDescription = request.getParameter("fileDescription");
        // ���� �̸�
		out.print("�ۼ���: " + fileWriter + "<br>");
		out.print("���ϸ�:<a href='FileDownloadTest?fileName=" + fName + "'> " + fName + "</a href><br>"); 
		out.print("���ϼ���: "+ fileDescription + "<br>"); // �ٿ�ε� �߰�
		out.print("����ũ��: " + part.getSize() + " bytes" + "<br>");
		out.println("post ��� ȣ�� : " + price);
		*/
		
		GalleryDaoInter dao = GalleryDaoImpl.getDao();
		GalleryVO v = new GalleryVO();
		v.setImgname(fName);
		v.setPrice(price);
		v.setQty(qty);
		v.setComm(comm);
		v.setReip(reip);	
		
		
		dao.add(v);
		response.sendRedirect("list.jsp");
//		
//		List<GalleryVO> list = dao.list();
//		System.out.println("size: " + list.size());
		
	}

	private String getFileName(Part part) {
		
		String contentDisp = part.getHeader("content-disposition");
		String[] split = contentDisp.split(";");
		//[form-data, name="fileName" filename="���õ�����"
		for(int i=0;i< split.length; i++) {
			String temp = split[i];
			if(temp.trim().startsWith("filename")) {
				String res=temp.substring(temp.indexOf("=")+2, temp.length() -1);
				return res;
			}			
		}
		return "";	
	}
}
