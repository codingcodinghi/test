package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import factory.FactoryService;
import vo.GalleryVO;

public class GalleryDaoImple implements GalleryDaoInter {
	private static GalleryDaoImple dao;

	public GalleryDaoImple() {
	}

	public synchronized static GalleryDaoImple getDao() {
		if (dao == null) {
			dao = new GalleryDaoImple();
		}
		return dao;
	}

	@Override
	public void add(GalleryVO v) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		// mapper/gallery.xml�� �ۼ��� namespace="gallery" ���ӽ����̽��� ��з�,<insertid="add" id��
		// �Һз�
		// insert~~~values(.....#{xx}); #{xx}�� ���ͷ� �����Ѵ�.
		// �� ���� ������ mapping�� ���ֱ� ���� ����)
		// ss.insert("namespace,id",parameter�� �ּҳ� ��);
		ss.insert("gallery.add", v);
		// ss.commit(); //������ Ŀ���� �������// 25�ٿ� true�� �ۼ��ϸ� 31�� �ۼ����ص���// ���۾��� ����������Ƽ��
		ss.close();
	}

	@Override
	public List<GalleryVO> list() {
		// <select id="list" resultType="vo.GalleryVO">
		// select * from ~ => ALL
		SqlSession ss = FactoryService.getFactory().openSession();
		// while(rs.next()) ~ vo.setter(rs.getXX()) ~ list.add(vo) �� selectList�ϳ��� ������
		// ��ü
		List<GalleryVO> list = ss.selectList("gallery.list"); // public List<GalleryVO> list() {���⿡ �Ű������� �ִٸ�
																// 41���ǳ���("gallery.list", num);����
		ss.close();
		return list;
	}

	@Override
	public GalleryVO detail(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		// �ϳ��� row�� ��ȯ
		GalleryVO vo = ss.selectOne("gallery.detail", num);
		ss.close();
		return vo;
	}

	@Override
	public void delete(int num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		ss.delete("gallery.del", num);
		ss.close();
	}

	@Override
	public void update(GalleryVO v) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		ss.update("gallery.up", v);
		ss.close();
	}

}
