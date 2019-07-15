package com.st.ssm.classification.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.classification.mapper.ClassificationMapper;
import com.st.ssm.classification.model.ClassificationModel;
import com.st.ssm.classification.service.IClassificationService;
import com.st.ssm.util.FmtEmpty;
@Service
public class ClassificationServiceImpl implements IClassificationService {
	@Autowired
	private ClassificationMapper classificationMapper;
	
	@Override
	public int insert(ClassificationModel model) {
		ClassificationModel cm = selectByCode(model.getCode()) ;
		if(FmtEmpty.isEmpty(cm)) {
			classificationMapper.insert(model);
			return 0;
		}
		return 1;
	}
	
	@Override
	public ClassificationModel selectByCode(String code) {
		return classificationMapper.selectByCode(code);
	}

	@Override
	public Object selectCount(ClassificationModel model) {
		return classificationMapper.selectCount(model);
	}

	@Override
	public List<ClassificationModel> selectModel(ClassificationModel model) {
		List<ClassificationModel> list = classificationMapper.selectModel(model);
		return list;
	}

	@Override
	public List<ClassificationModel> selectAll(ClassificationModel model) {
		return classificationMapper.selectAll(model);
	}

	@Override
	public int delete(ClassificationModel model) {
		return classificationMapper.delete(model);
	}


	@Override
	public int update(ClassificationModel model) {
		if(classificationMapper.update(model) == 1) {
			return 1;
		}
		return 0;
	}

	@Override
	public ClassificationModel search(ClassificationModel classificationModel) {
		ClassificationModel cm = new ClassificationModel();
		cm.setCode(classificationModel.getCode());
		List<ClassificationModel> list = selectAll(cm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

}
