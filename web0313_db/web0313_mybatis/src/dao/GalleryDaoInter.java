package dao;

import java.util.List;

import vo.GalleryVO;

public interface GalleryDaoInter {
	// GalleryVO 전송된 값을 받아서 처리하는 메서드 - insert
	void add(GalleryVO v);

	// List<GallerVO>에 저장해서 반환하는 메서드- select ★
	List<GalleryVO> list();

	// GalleryVO 에 저장해서 반환하는 메서드 - select * ~ where num?
	GalleryVO detail(int num);

	// ~ = 테이블명
	// delete from ~ where num=?
	void delete(int num);

	// update ~ col=?, col? where num=?
	void update(GalleryVO v);
}
