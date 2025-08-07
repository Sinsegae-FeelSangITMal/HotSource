package hotsource.model.asset;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Asset;
import hotsource.exception.AssetException;

@Repository
public class MybatisAssetDAO implements AssetDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Asset.selectAll");
	}
	
	@Override
	public List selectSaleAll() {
		return sqlSessionTemplate.selectList("Asset.selectSaleAll");
	}

	@Override
	public Asset select(long asset_id) {
		return sqlSessionTemplate.selectOne("Asset.select", asset_id);
	}

	public List selectBySellerId(long seller_id) {
		return sqlSessionTemplate.selectList("Asset.selectBySellerId", seller_id);
	}

	@Override
	public int selectCount(long seller_id) {
		return sqlSessionTemplate.selectOne("Asset.selectCount", seller_id);
	}

	@Override
	public List selectHot(int topcategory_id) {
		return sqlSessionTemplate.selectList("Asset.selectHot", topcategory_id);
	}

	@Override
	public List selectNew(int topcategory_id) {
		return sqlSessionTemplate.selectList("Asset.selectNew", topcategory_id);
	}

	@Override
	public List selectFree(int topcategory_id) {
		return sqlSessionTemplate.selectList("Asset.selectFree", topcategory_id);
	}

	@Override
	public List selectSale(int topcategory_id) {
		return sqlSessionTemplate.selectList("Asset.selectSale", topcategory_id);
	}

	
	@Override
	public void insert(Asset asset) throws AssetException{
		int result = sqlSessionTemplate.insert("Asset.insert", asset);
		if (result < 1)
			throw new AssetException("상품 등록 실패");
	}

	@Override
	public void update(Asset asset) {
		int result = sqlSessionTemplate.insert("Asset.update", asset);
		if (result < 1)
			throw new AssetException("상품 업데이트 실패");
	}

	@Override
	public void delete(long asset_id) {

	}

}
