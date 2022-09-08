package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.domain.MemberCriteria;

public interface MemberMGMapper {

	/* ● 회원 목록 페이지 */
	//회원 리스트 전체 (탈퇴 x)
	public List<MemberDTO> getListWithdrawNPaging(MemberCriteria cri) throws Exception;
	public int getWithdrawNCnt(MemberCriteria cri) throws Exception;
	

	//회원 탈퇴
	public int updateWithdrawY(String member_id) throws Exception;
	
	
	/* ● 회원정보 상세 페이지 */
	public MemberDTO read(String member_id) throws Exception;
	
	/* ● 회원정보 수정 페이지 */
	//닉네임 중복 확인
	public String confirmNick(MemberDTO mDto) throws Exception;
	
	public boolean update(MemberDTO mDto) throws Exception;
	
	/* ● 탈퇴한 회원 관리 페이지 */
	public List<MemberDTO> getListWithdrawYPaging(MemberCriteria cri) throws Exception;
	public int getWithdrawYCnt(MemberCriteria cri) throws Exception;
	
	public int updateWithdrawN(String member_id) throws Exception;
	public int delete(String member_id) throws Exception;
	
	
	
	/* ● 회원 권한 페이지 */
	public int insertAuth(String member_id) throws Exception;
	public int deleteAuth(String member_id) throws Exception;
	
	
}
