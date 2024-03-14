package dao;

import java.util.List;

import vo.GalleryVO;

public interface GalleryDaoInter {
	    //입력 insert
		void add(GalleryVO v);
		//리스트 select
		List<GalleryVO> list();
		//상세보기  select detail
		GalleryVO detail(int num);		
		//삭제 delete
		void del(int num);
		//수정 update
		void upd(GalleryVO v);
}
