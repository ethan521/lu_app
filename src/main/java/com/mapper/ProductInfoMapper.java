package com.mapper;

import com.model.ProductInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    ProductInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKeyWithBLOBs(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);

    ProductInfo selectByProductName(@Param("productName")String productName);
    List<ProductInfo> selectAllProduct();

    List<ProductInfo> selectProductByStatus(@Param("productStatus")String productStatus);
    int updateRemainAmount(@Param("productName")String productName, @Param("remainAmount")Float remainAmount, @Param("applyRecord")String applyRecord);
    int updateProductStatus(@Param("productName")String productName, @Param("productStatus")String productStatus);

    List<ProductInfo> select();
}