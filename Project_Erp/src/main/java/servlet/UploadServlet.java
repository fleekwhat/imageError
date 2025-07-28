package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 업로드 경로 설정
	private static final String UPLOAD_DIR = "upload";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 실제 서버 경로 얻기
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

		// 디렉토리 없으면 생성
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdir();

		try {
			// FileItemFactory 및 업로드 설정
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");

			// 요청 파싱
			List<FileItem> formItems = upload.parseRequest(request);

			String name = null, description = null, status = null;
			int price = 0;
			String imageFileName = null;

			if (formItems != null && !formItems.isEmpty()) {
				for (FileItem item : formItems) {
					if (item.isFormField()) {
						String fieldName = item.getFieldName();
						String fieldValue = item.getString("UTF-8");

						switch (fieldName) {
							case "name": name = fieldValue; break;
							case "description": description = fieldValue; break;
							case "price": price = Integer.parseInt(fieldValue); break;
							case "status": status = fieldValue; break;
						}
					} else {
						String fileName = new File(item.getName()).getName();
						if (!fileName.isEmpty()) {
							imageFileName = System.currentTimeMillis() + "_" + fileName;
							String filePath = uploadPath + File.separator + imageFileName;
							File storeFile = new File(filePath);
							item.write(storeFile);
						}
					}
				}
			}

			// 여기에 DB 저장 로직
			// ProductDto dto = new ProductDto(name, description, price, status, imageFileName);
			// new ProductDao().insert(dto);

			response.sendRedirect("product/list.jsp");

		} catch (Exception ex) {
			ex.printStackTrace();
			response.getWriter().println("파일 업로드 중 오류 발생: " + ex.getMessage());
		}
	}
}
