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
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true�� �ڵ� commit
		//mapper/gallery.xml�� �ۼ��� namespace="gallery">
		//<insert id="add" parameterType="vo.GalleyVO"> 
		// ss.insert(namwspace.id,�Ķ����)
		ss.insert("gallery.add",v);
		//ss.commit();
		ss.close();	
	}

	@Override
	public List<GalleryVO> list() {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n�� 
		List<GalleryVO> list = ss.selectList("gallery.list");
		ss.close();
		return list;
	}

	@Override
	public GalleryVO detail(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n�� 
		GalleryVO vo = ss.selectOne("gallery.detail", num);
		ss.close();
		return vo;
	}

	@Override
	public void del(int num) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true�� �ڵ� commit		
		ss.delete("gallery.del",num);
		//ss.commit();
		ss.close();	
		
	}

	@Override
	public void upd(GalleryVO v) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true�� �ڵ� commit		
		ss.update("gallery.upd",v);
		//ss.commit();
		ss.close();	
		
	}

}
