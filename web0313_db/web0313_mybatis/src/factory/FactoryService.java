package factory;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
//SqlSessionFactory는 결국 SqlSession을 관리하는 객체이고
//SqlSession를 사용해서 작성한 mapper의 SQL문을 오라클 서버로 전송할 수 있다.
//config.xml이 mapper 즉 sql문까지 포함되고 있기 때문에 불러와서 사용가능한 객체
//SqlSession 반환

	static {
		try (Reader reader = Resources.getResourceAsReader("config/config.xml");) {
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}

}
