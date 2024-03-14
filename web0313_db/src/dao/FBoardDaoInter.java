package dao;
import java.util.List;
import vo.FboardVO;

public interface FBoardDaoInter {

	public void addFboard(FboardVO vo);
	public List<FboardVO> listFboard();
	public void updateHit(int num); //hit
	public FboardVO datailFboard(int num);
	public boolean chkPwd(FboardVO vo);
	public void deleteFboard(int num);
	public void updateFboard(FboardVO vo);
}
