package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import factory.FactoryService;
import vo.FboardVO;

public class FboardImpl implements FBoardDaoInter{
	private static FboardImpl dao;
	private FboardImpl() {
		
	}
	
	public synchronized static FboardImpl getDao() {
		if(dao== null) {
			dao = new FboardImpl();
		}
		return dao;		
	}
	@Override
	public void addFboard(FboardVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit
		//mapper/fboard.xml에 작성한 namespace="fboard">
		//<insert id="add" parameterType="vo.GalleyVO"> 
		// ss.insert(namwspace.id,파라메터)
		ss.insert("fboard.add",vo);
		//ss.commit();
		ss.close();	
	}

	@Override
	public List<FboardVO> listFboard() {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n건 
		List<FboardVO> list = ss.selectList("fboard.list");
		ss.close();
		return list;
	}

	@Override
	public void updateHit(int num) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit		
		ss.update("fboard.hit",num);
		//ss.commit();
		ss.close();	
		
	}

	@Override
	public FboardVO datailFboard(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n건 
		FboardVO vo = ss.selectOne("fboard.detail", num);
		ss.close();
		return vo;
	}

	@Override
	public boolean chkPwd(FboardVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//while rs.next() vo.setter(rs.getXX())  list.add(vo)
		// selectList : List  n건 		
		int num1 = ss.selectOne("fboard.chkPwd", vo);
		ss.close();
		System.out.println("num1:" + num1);
		if(num1 > 0) {
			return true;
		}		
		
		return false;
	}

	@Override
	public void deleteFboard(int num) {
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit		
		ss.delete("fboard.del",num);
		//ss.commit();
		ss.close();	
	}

	@Override
	public void updateFboard(FboardVO vo) {
		//System.out.println("iin updateFboard vo.getContent: " + vo.getContent());
		SqlSession ss = FactoryService.getFactory().openSession(true); //openSession(true) true는 자동 commit		
		ss.update("fboard.upd", vo);
		System.out.println("after updateFboard vo.getContent: " + vo.getContent());
		//ss.commit();
		ss.close();	
	}

}
