package dao;

import java.util.List;

import vo.GalleryVO;

public interface GalleryDaoInter {
	// GalleryVO ���۵� ���� �޾Ƽ� ó���ϴ� �޼��� - insert
	void add(GalleryVO v);

	// List<GallerVO>�� �����ؼ� ��ȯ�ϴ� �޼���- select ��
	List<GalleryVO> list();

	// GalleryVO �� �����ؼ� ��ȯ�ϴ� �޼��� - select * ~ where num?
	GalleryVO detail(int num);

	// ~ = ���̺��
	// delete from ~ where num=?
	void delete(int num);

	// update ~ col=?, col? where num=?
	void update(GalleryVO v);
}
