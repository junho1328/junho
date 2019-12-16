package com.icia.fontExample;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.transaction.annotation.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.Service.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class Test {
	@Autowired
	private FavoriteDao dao;
	@Autowired
	private FavoriteService service;

	@org.junit.Test
	public void test() {
		assertThat(service.findFavorite("spring").size(),is(4));
	}
}
