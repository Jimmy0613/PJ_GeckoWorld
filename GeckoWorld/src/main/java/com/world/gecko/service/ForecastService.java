package com.world.gecko.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.FcstNxNy;

@Service
public class ForecastService {

	@Autowired
	private EntityManager em;

	public List<String> getFirstDistinct() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("first")).distinct(true);

		return em.createQuery(cq).getResultList();
	}

	public List<String> getSecondByFirst(String first) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("second")).distinct(true);
		cq.where(cb.equal(root.get("first"), first));

		return em.createQuery(cq).getResultList();
	}

	public List<String> getThirdByFirstAndSecond(String first, String second) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("third"));
		cq.where(cb.equal(root.get("first"), first), cb.equal(root.get("second"), second));

		return em.createQuery(cq).getResultList();
	}

	public FcstNxNy getNxNy(String first, String second, String third) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<FcstNxNy> cq = cb.createQuery(FcstNxNy.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root).where(cb.equal(root.get("first"), first), cb.equal(root.get("second"), second),
				cb.equal(root.get("third"), third));

		return em.createQuery(cq).getSingleResult();
	}

}
