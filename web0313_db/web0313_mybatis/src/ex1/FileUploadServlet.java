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
//enctype="multipart/form-data"일 경우
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
			System.out.println("파일이 존재합니당");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("Get방식표출");
	}

	// 선생님 주석확인
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		int price = Integer.parseInt(request.getParameter("price"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		String comm = request.getParameter("comm");
		// 파일처리
		Part part = request.getPart("fileName");
		// 파일의 이름을 추출
		String fName = getFileName(part);

		// 스크린샷_1.jpg
		String[] imgTgs = fName.split("\\.");

		long st = System.currentTimeMillis();
		fName = st + "." + imgTgs[1];

		if (!fName.isEmpty()) {
			// 파일을 저장위치에 output한다.
			part.write(path + fName); // outputsteam을 파트라이트가 제공해주는것
		}
		PrintWriter out = response.getWriter();
		out.println("price : " + price);
		out.println("qty : " + qty);
		out.println("comm : " + comm);
		out.println("fName : " + fName);
		GalleryDaoInter dao = GalleryDaoImple.getDao();
		// GalleryVO생성후 setter로 값 저장
		GalleryVO v = new GalleryVO();
		v.setImgname(fName);
		v.setReip(request.getRemoteAddr());
		v.setPrice(price);
		v.setQty(qty);
		v.setComm(comm);
		dao.add(v);
		response.sendRedirect("list.jsp");
	}

	// getFileName은 선생님 주석확인
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
