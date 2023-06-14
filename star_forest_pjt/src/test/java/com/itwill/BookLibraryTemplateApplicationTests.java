package com.itwill;

import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@SpringBootApplication(scanBasePackages = {"com.itwill.util.RequestBoardPage"})
class BookLibraryTemplateApplicationTests {

	@Test
	void contextLoads() {
	}

}
