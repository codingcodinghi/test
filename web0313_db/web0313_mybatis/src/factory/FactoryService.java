package factory;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
//SqlSessionFactory�� �ᱹ SqlSession�� �����ϴ� ��ü�̰�
//SqlSession�� ����ؼ� �ۼ��� mapper�� SQL���� ����Ŭ ������ ������ �� �ִ�.
//config.xml�� mapper �� sql������ ���Եǰ� �ֱ� ������ �ҷ��ͼ� ��밡���� ��ü
//SqlSession ��ȯ

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
