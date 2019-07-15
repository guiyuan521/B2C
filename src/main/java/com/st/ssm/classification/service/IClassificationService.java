package com.st.ssm.classification.service;

import java.util.List;



import com.st.ssm.classification.model.ClassificationModel;

public interface IClassificationService {

	int insert(ClassificationModel model);

	ClassificationModel selectByCode(String code);

	Object selectCount(ClassificationModel model);

	List<ClassificationModel> selectModel(ClassificationModel model);

	List<ClassificationModel> selectAll(ClassificationModel model);

	int delete(ClassificationModel model);

	int update(ClassificationModel model);

	ClassificationModel search(ClassificationModel classificationModel);


}
