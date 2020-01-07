package com.diboot.component.excel.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.CellData;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IntegerConverter implements Converter<Integer> {

    private static final Logger log = LoggerFactory.getLogger(IntegerConverter.class);

    @Override
    public Class supportJavaTypeKey() {
        return Integer.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.NUMBER;
    }

    @Override
    public Integer convertToJavaData(CellData cellData, ExcelContentProperty contentProperty, GlobalConfiguration globalConfiguration) throws Exception {
        Integer value = null;
        String colName = contentProperty.getHead().getHeadNameList().get(0);//当前列
        try {
            value = cellData.getNumberValue().intValue();
        } catch (Exception e) {
            log.error("["+colName+"]列数据格式有误，请填写正确的整型数据", e);
            throw new Exception("["+colName+"]列数据格式有误，请填写正确的整型数据");
        }
        return value;
    }

    @Override
    public CellData convertToExcelData(Integer value, ExcelContentProperty contentProperty, GlobalConfiguration globalConfiguration) throws Exception {
        return new CellData(value.toString());
    }
}
