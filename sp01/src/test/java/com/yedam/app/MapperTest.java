package com.yedam.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardVO;
import com.yedam.app.emp.mapper.EmpMapper;
import com.yedam.app.emp.service.EmpVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/*-context.xml")
public class MapperTest {
	
	@Autowired
	EmpMapper empMapper;
	
	@Autowired
	BoardMapper boardMapper;
	
	//전체조회
	//@Test
	public void selectAll() {
		List<EmpVO> list = empMapper.selectEmpList();
		assertTrue(!list.isEmpty());
	}
	

	//단건조회
	//@Test
	public void selectInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(100);
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		assertEquals(findVO.getLastName(), "King");
	}
	
	//등록
	//@Test
	public void insertInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setLastName("Hong");
		empVO.setEmail("kdong@google.com");
		empVO.setHireDate(new Date("24/01/15"));
		empVO.setJobId("IT_PROG");
		empVO.setSalary(10000);
		
		int result = empMapper.insertEmpInfo(empVO);
		assertNotEquals(result, 0);//assertNotEquals(empVO.getEmployeeId(), 0);도 가능
	}
	
	//수정 - dynamic sql사용x
	//@Test
	public void updateInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(207);
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		findVO.setLastName("Kang");
		int result = empMapper.updateEmpInfo(findVO);
		assertNotEquals(result, 0);
	}
	
	//수정2 : dynamic sql사용- 특정한 조건을 만족하는경우만 모아서..변경된 데이터만 전송
	//@Test
	public void updateInfoDynamic() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(207);
		empVO.setSalary(5200);
		int result = empMapper.updateEmpInfoDynamic(empVO);
		assertNotEquals(result, 0);
	}
	
	//삭제
	//@Test
	public void deleteInfo() {
		int result = empMapper.deleteEmpInfo(207);
		assertNotEquals(result, 0);
	}
	
	/////////////////////////Board
	
	//게시판전체조회
	//@Test
	public void selectAll2() {
		List<BoardVO> list = boardMapper.selectBoardList();
		assertTrue(!list.isEmpty());
	}
	
	//게시판 단건
	@Test
	public void selectInfo2() {
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(1001);
		BoardVO findVO = boardMapper.selectBoard(boardVO);
		assertEquals(findVO.getWriter(), "ABC");
	}
	
	//등록
		//@Test
		public void insertInfo2() {
			BoardVO boardVO = new BoardVO();
			boardVO.setTitle("ABC1121");
			boardVO.setContents("ASDd");
			boardVO.setWriter("ABCd");
			boardVO.setImage("asdsadasd2");

			
			int result = boardMapper.insertBoard(boardVO);
			assertNotEquals(result, 0);//assertNotEquals(empVO.getEmployeeId(), 0);도 가능
		}
	
	
}
