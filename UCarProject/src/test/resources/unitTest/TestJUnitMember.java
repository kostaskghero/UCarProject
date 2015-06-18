package unitTest;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ucar.admin.member.model.AdminMemberDAO;
import ucar.car.model.CarDAO;
import ucar.member.model.MemberDAO;
import ucar.member.model.MemberDAOImpl;

/**
 * * TDD : 테스트 주도 개발(test-driven development, TDD)은 매우 짧은 개발 사이클을 반복하는 소프트웨어 개발
 * 프로세스
 * 
 * JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 * 
 * 아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. <!-- spring junit --> <dependency>
 * <groupId>org.springframework</groupId> <artifactId>spring-test</artifactId>
 * <version>${org.springframework-version}</version> </dependency>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TestJUnitMember {
	@Resource(name="adminMemberDAOImpl")
	private AdminMemberDAO adminMemberDAO;
	@Resource(name="memberDAOImpl")
	private MemberDAO memberDAO;
	@Resource(name="carDAOImpl")
	private CarDAO carDAO;

	@Test
	public void memberTest() {
		System.out.println(carDAO.checkUCarZone("신천역"));
	}

}
