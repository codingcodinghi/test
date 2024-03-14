package dao;

import java.util.List;

import vo.GalleryVO;

public interface GalleryDaoInter {
	    //�Է� insert
		void add(GalleryVO v);
		//����Ʈ select
		List<GalleryVO> list();
		//�󼼺���  select detail
		GalleryVO detail(int num);		
		//���� delete
		void del(int num);
		//���� update
		void upd(GalleryVO v);
}
