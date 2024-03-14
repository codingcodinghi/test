package ex1;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.GalleryDaoImple;
import dao.GalleryDaoInter;
import vo.GalleryVO;

@WebServlet(name = "/FileUpload", urlPatterns = "/gallery/FileUpload")
//enctype="multipart/form-data"�� ���
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 1024 * 1024)
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String path = "";

	public FileUploadServlet() {
		path = "D:\\ICTEDU\\SpringMVC\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\web0313_mybatis\\resources\\img\\";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		} else {
			System.out.println("������ �����մϴ�");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("Get���ǥ��");
	}

	// ������ �ּ�Ȯ��
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		int price = Integer.parseInt(request.getParameter("price"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		String comm = request.getParameter("comm");
		// ����ó��
		Part part = request.getPart("fileName");
		// ������ �̸��� ����
		String fName = getFileName(part);

		// ��ũ����_1.jpg
		String[] imgTgs = fName.split("\\.");

		long st = System.currentTimeMillis();
		fName = st + "." + imgTgs[1];

		if (!fName.isEmpty()) {
			// ������ ������ġ�� output�Ѵ�.
			part.write(path + fName); // outputsteam�� ��Ʈ����Ʈ�� �������ִ°�
		}
		PrintWriter out = response.getWriter();
		out.println("price : " + price);
		out.println("qty : " + qty);
		out.println("comm : " + comm);
		out.println("fName : " + fName);
		GalleryDaoInter dao = GalleryDaoImple.getDao();
		// GalleryVO������ setter�� �� ����
		GalleryVO v = new GalleryVO();
		v.setImgname(fName);
		v.setReip(request.getRemoteAddr());
		v.setPrice(price);
		v.setQty(qty);
		v.setComm(comm);
		dao.add(v);
		response.sendRedirect("list.jsp");
	}

	// getFileName�� ������ �ּ�Ȯ��
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println("contentDisp : " + contentDisp);
		String[] split = contentDisp.split(";");
		System.out.println(Arrays.toString(split));
		for (int i = 0; i < split.length; i++) {
			String temp = split[i];
			if (temp.trim().startsWith("filename")) {
				String res = temp.substring(temp.indexOf("=") + 2, temp.length() - 1);
				System.out.println(res);
				return res;
			}
		}
		return "";
	}

}
