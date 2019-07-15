package com.st.ssm.information.mapper;

import java.util.List;

import com.st.ssm.information.model.InformationModel;

public interface InformationMapper {

	List<InformationModel> selectList(InformationModel model);

	Object selectCount(InformationModel model);

	List<InformationModel> selectModel(InformationModel model);

	int insert(InformationModel model);

	int delete(InformationModel model);

	int update(InformationModel model);

	

}
