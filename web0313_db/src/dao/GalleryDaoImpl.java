package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import factory.FactoryService;
import vo.GalleryVO;

public class GalleryDaoImpl implements GalleryDaoInter {

	private static  GalleryDaoImpl dao;
	public synchronized static GalleryDaoImpl getDao() {
		if(dao==null) {
			dao = new GalleryDaoImpl();
		}
		return dao;
	}
	
	@Override
	public void add(GalleryVO v) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit
		//mapper/gallery.xml에 작성한 namespace="gallery">
		//<insert id="add" parameterType="vo.GalleyVO"> 
		// ss.insert(namwspace.id,파라메터)
		ss.insert("gallery.add",v);
		//ss.commit();
		ss.close();	
	}

	@Override
	public List<GalleryVO> list() {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n건 
		List<GalleryVO> list = ss.selectList("gallery.list");
		ss.close();
		return list;
	}

	@Override
	public GalleryVO detail(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n건 
		GalleryVO vo = ss.selectOne("gallery.detail", num);
		ss.close();
		return vo;
	}

	@Override
	public void del(int num) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit		
		ss.delete("gallery.del",num);
		//ss.commit();
		ss.close();	
		
	}

	@Override
	public void upd(GalleryVO v) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit		
		ss.update("gallery.upd",v);
		//ss.commit();
		ss.close();	
		
	}

}
