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
		// mapper/gallery.xml에 작성한 namespace="gallery" 네임스페이스는 대분류,<insertid="add" id는
		// 소분류
		// insert~~~values(.....#{xx}); #{xx}을 게터로 매핑한다.
		// 즉 위의 구조로 mapping을 해주기 위한 문법)
		// ss.insert("namespace,id",parameter의 주소나 값);
		ss.insert("gallery.add", v);
		// ss.commit(); //지금은 커밋을 해줘야함// 25줄에 true를 작성하면 31은 작성안해도됌// 이작업은 오리지날바티스
		ss.close();
	}

	@Override
	public List<GalleryVO> list() {
		// <select id="list" resultType="vo.GalleryVO">
		// select * from ~ => ALL
		SqlSession ss = FactoryService.getFactory().openSession();
		// while(rs.next()) ~ vo.setter(rs.getXX()) ~ list.add(vo) 가 selectList하나로 역할을
		// 대체
		List<GalleryVO> list = ss.selectList("gallery.list"); // public List<GalleryVO> list() {여기에 매개변수가 있다면
																// 41번맨끝은("gallery.list", num);느낌
		ss.close();
		return list;
	}

	@Override
	public GalleryVO detail(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		// 하나의 row만 반환
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
