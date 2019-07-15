package com.st.ssm.classification.mapper;

import java.util.List;


import com.st.ssm.classification.model.ClassificationModel;

public interface ClassificationMapper {

	int insert(ClassificationModel model);

	ClassificationModel selectByCode(String code);

	Object selectCount(ClassificationModel model);

	List<ClassificationModel> selectModel(ClassificationModel model);

	List<ClassificationModel> selectAll(ClassificationModel model);

	int delete(ClassificationModel model);

	int update(ClassificationModel model);

}
