package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;

import dao.ProductDao;
import dto.ProductDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "upload";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// 실제 웹 경로에 저장 (webapp/upload)
		String uploadPath = getServletContext().getRealPath("/" + UPLOAD_DIR);
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdirs();

		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		String status = request.getParameter("status");

		Part filePart = request.getPart("image");
		String imageFileName = null;

		if (filePart != null && filePart.getSize() > 0) {
			String originalFileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();
			imageFileName = System.currentTimeMillis() + "_" + originalFileName;

			File file = new File(uploadPath, imageFileName);
			try (InputStream input = filePart.getInputStream()) {
				Files.copy(input, file.toPath());
			}
		}

		// 타입 오류 수정: int price → price만 씀
		ProductDto dto = new ProductDto(name, description, price, status, imageFileName);
		boolean success = new ProductDao().insert(dto);

		if (success) {
			response.sendRedirect("product/list.jsp");
		} else {
			response.getWriter().println("DB 저장 실패");
		}
	}
}
