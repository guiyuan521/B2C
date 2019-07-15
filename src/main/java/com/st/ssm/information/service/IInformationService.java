package com.st.ssm.information.service;

import java.util.List;

import com.st.ssm.information.model.InformationModel;

public interface IInformationService {

	Object selectCount(InformationModel model);

	List<InformationModel> selectModel(InformationModel model);

	int insertByCode(InformationModel model);

	int delete(InformationModel model);

	int update(InformationModel model);

	InformationModel selectList(InformationModel informationModel);





}
