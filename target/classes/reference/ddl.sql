-- attached_file
DROP TABLE IF EXISTS `attached_file` RESTRICT;

-- file_detail
DROP TABLE IF EXISTS `file_detail` RESTRICT;

-- authority_rel
DROP TABLE IF EXISTS `authority_rel` RESTRICT;

-- authority
DROP TABLE IF EXISTS `authority` RESTRICT;

-- evaluation_logic
DROP TABLE IF EXISTS `evaluation_logic` RESTRICT;

-- logic
DROP TABLE IF EXISTS `logic` RESTRICT;

-- evaluation_project
DROP TABLE IF EXISTS `evaluation_project` RESTRICT;

-- project
DROP TABLE IF EXISTS `project` RESTRICT;

-- grouping_member
DROP TABLE IF EXISTS `grouping_member` RESTRICT;

-- grouping
DROP TABLE IF EXISTS `_grouping` RESTRICT;

-- user_info
DROP TABLE IF EXISTS `user_info` RESTRICT;

-- attached_file
CREATE TABLE `attached_file` (
	`original_no`      VARCHAR(100) NOT NULL, -- original_no
	`attached_file_no` VARCHAR(200) NOT NULL  -- attached_file_no
);

-- authority
CREATE TABLE `authority` (
	`authority_id`   VARCHAR(100) NOT NULL, -- authority_id
	`authority_name` VARCHAR(100) NOT NULL  -- authority_name
);

-- authority
ALTER TABLE `authority`
	ADD CONSTRAINT
		PRIMARY KEY (
			`authority_id` -- authority_id
		);

-- authority_rel
CREATE TABLE `authority_rel` (
	`user_id`      VARCHAR(100) NOT NULL, -- user_id
	`authority_id` VARCHAR(100) NOT NULL  -- authority_id
);

-- project
CREATE TABLE `project` (
	`project_no`      VARCHAR(100)  NOT NULL, -- project_no
	`project_name`    VARCHAR(500)  NOT NULL, -- project_name
	`generating_date` DATETIME      NOT NULL, -- generating_date
	`user_id`         VARCHAR(100)  NOT NULL, -- user_id
	`coments`         VARCHAR(5000) NULL      -- coments
);

-- project
ALTER TABLE `project`
	ADD CONSTRAINT
		PRIMARY KEY (
			`project_no` -- project_no
		);

-- evaluation_logic
CREATE TABLE `evaluation_logic` (
	`evaluation_no`   VARCHAR(100) NOT NULL, -- evaluation_no
	`score`           VARCHAR(100) NOT NULL, -- score
	`original_no`     VARCHAR(100) NOT NULL, -- original_no
	`evaluating_date` DATETIME     NOT NULL, -- evaluating_date
	`user_id`         VARCHAR(100) NOT NULL, -- user_id
	`comment`         VARCHAR(500) NULL      -- comment
);

-- evaluation_logic
ALTER TABLE `evaluation_logic`
	ADD CONSTRAINT
		PRIMARY KEY (
			`evaluation_no` -- evaluation_no
		);

-- file_detail
CREATE TABLE `file_detail` (
	`attached_file_no`        VARCHAR(200) NOT NULL, -- attached_file_no
	`attached_file_directory` VARCHAR(500) NULL,     -- attached_file_directory
	`attached_file_name`      VARCHAR(500) NULL,     -- attached_file_name
	`attached_file_type`      VARCHAR(300) NULL,     -- attached_file_type
	`attached_file_date`      DATETIME     NULL      -- attached_file_add
);

-- file_detail
ALTER TABLE `file_detail`
	ADD CONSTRAINT
		PRIMARY KEY (
			`attached_file_no` -- attached_file_no
		);

-- _grouping
CREATE TABLE `_grouping` (
	`group_no`        VARCHAR(100) NOT NULL, -- group_no
	`group_name`      VARCHAR(100) NOT NULL, -- group_name
	`keyword`         VARCHAR(500) NULL,     -- keyword
	`generating_date` DATETIME     NOT NULL, -- generating_date
	`user_id`         VARCHAR(100) NOT NULL  -- user_id
);

-- _grouping
ALTER TABLE `_grouping`
	ADD CONSTRAINT
		PRIMARY KEY (
			`group_no` -- group_no
		);

-- grouping_member
CREATE TABLE `grouping_member` (
	`group_no` VARCHAR(100) NOT NULL, -- group_no
	`user_id`  VARCHAR(100) NOT NULL  -- user_id
);

-- logic
CREATE TABLE `logic` (
	`original_no`     VARCHAR(100)  NOT NULL, -- original_no
	`project_no`      VARCHAR(100)  NOT NULL, -- project_no
	`summary`         VARCHAR(500)  NOT NULL, -- summary
	`contents`        VARCHAR(5000) NULL,     -- contents
	`category`        VARCHAR(100)  NOT NULL, -- category
	`generating_date` DATETIME      NOT NULL, -- generating_date
	`source_no`       VARCHAR(100)  NULL,     -- source_no
	`user_id`         VARCHAR(100)  NOT NULL  -- user_id
);

-- logic
ALTER TABLE `logic`
	ADD CONSTRAINT
		PRIMARY KEY (
			`original_no` -- original_no
		);

-- user_info
CREATE TABLE `user_info` (
	`user_id`        VARCHAR(100) NOT NULL, -- user_id
	`id`             VARCHAR(100) NOT NULL, -- id
	`pw`             VARCHAR(100) NOT NULL, -- pw
	`name`           VARCHAR(20)  NOT NULL, -- name
	`email`          VARCHAR(500) NOT NULL, -- email
	`tel`            VARCHAR(50)  NOT NULL, -- tel
	`address`        VARCHAR(500) NOT NULL, -- address
	`generated_date` DATETIME     NOT NULL, -- generated_date
	`address_detail` VARCHAR(500) NOT NULL  -- address_detail
);

-- user_info
ALTER TABLE `user_info`
	ADD CONSTRAINT
		PRIMARY KEY (
			`user_id` -- user_id
		);

-- evaluation_project
CREATE TABLE `evaluation_project` (
	`evaluation_no`   VARCHAR(100) NOT NULL, -- evaluation_no
	`project_no`      VARCHAR(100) NULL,     -- project_no
	`score`           VARCHAR(100) NOT NULL, -- score
	`evaluating_date` DATETIME     NOT NULL, -- evaluating_date
	`user_id`         VARCHAR(100) NOT NULL, -- user_id
	`comment`         VARCHAR(500) NULL      -- comment
);

-- evaluation_project
ALTER TABLE `evaluation_project`
	ADD CONSTRAINT
		PRIMARY KEY (
			`evaluation_no` -- evaluation_no
		);

-- attached_file
ALTER TABLE `attached_file`
	ADD CONSTRAINT `FK_fl_detail_TO_attached_fl` -- FK_fl_detail_TO_attached_fl
		FOREIGN KEY (
			`attached_file_no` -- attached_file_no
		)
		REFERENCES `file_detail` ( -- file_detail
			`attached_file_no` -- attached_file_no
		),
	ADD INDEX `FK_fl_detail_TO_attached_fl` (
		`attached_file_no` -- attached_file_no
	);

-- attached_file
ALTER TABLE `attached_file`
	ADD CONSTRAINT `FK_logic_TO_attached_file` -- FK_logic_TO_attached_file
		FOREIGN KEY (
			`original_no` -- original_no
		)
		REFERENCES `logic` ( -- logic
			`original_no` -- original_no
		),
	ADD INDEX `FK_logic_TO_attached_file` (
		`original_no` -- original_no
	);

-- authority_rel
ALTER TABLE `authority_rel`
	ADD CONSTRAINT `FK_authority_TO_authority_rel` -- FK_authority_TO_authority_rel
		FOREIGN KEY (
			`authority_id` -- authority_id
		)
		REFERENCES `authority` ( -- authority
			`authority_id` -- authority_id
		),
	ADD INDEX `FK_authority_TO_authority_rel` (
		`authority_id` -- authority_id
	);

-- authority_rel
ALTER TABLE `authority_rel`
	ADD CONSTRAINT `FK_user_info_TO_authority_rel` -- FK_user_info_TO_authority_rel
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_authority_rel` (
		`user_id` -- user_id
	);

-- project
ALTER TABLE `project`
	ADD CONSTRAINT `FK_user_info_TO_business` -- FK_user_info_TO_business
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_business` (
		`user_id` -- user_id
	);

-- evaluation_logic
ALTER TABLE `evaluation_logic`
	ADD CONSTRAINT `FK_logic_TO_evaluation` -- FK_logic_TO_evaluation
		FOREIGN KEY (
			`original_no` -- original_no
		)
		REFERENCES `logic` ( -- logic
			`original_no` -- original_no
		),
	ADD INDEX `FK_logic_TO_evaluation` (
		`original_no` -- original_no
	);

-- evaluation_logic
ALTER TABLE `evaluation_logic`
	ADD CONSTRAINT `FK_user_info_TO_evaluation` -- FK_user_info_TO_evaluation
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_evaluation` (
		`user_id` -- user_id
	);

-- _grouping
ALTER TABLE `_grouping`
	ADD CONSTRAINT `FK_user_info_TO_grouping` -- FK_user_info_TO_grouping
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_grouping` (
		`user_id` -- user_id
	);

-- grouping_member
ALTER TABLE `grouping_member`
	ADD CONSTRAINT `FK_grouping_TO_grouping_member` -- FK_grouping_TO_grouping_member
		FOREIGN KEY (
			`group_no` -- group_no
		)
		REFERENCES `_grouping` ( -- _grouping
			`group_no` -- group_no
		),
	ADD INDEX `FK_grouping_TO_grouping_member` (
		`group_no` -- group_no
	);

-- grouping_member
ALTER TABLE `grouping_member`
	ADD CONSTRAINT `FK_user_info_TO_grouping_member` -- FK_user_info_TO_grouping_member
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_grouping_member` (
		`user_id` -- user_id
	);

-- logic
ALTER TABLE `logic`
	ADD CONSTRAINT `FK_business_TO_logic` -- FK_business_TO_logic
		FOREIGN KEY (
			`project_no` -- project_no
		)
		REFERENCES `project` ( -- project
			`project_no` -- project_no
		),
	ADD INDEX `FK_business_TO_logic` (
		`project_no` -- project_no
	);

-- logic
ALTER TABLE `logic`
	ADD CONSTRAINT `FK_logic_TO_logic` -- FK_logic_TO_logic
		FOREIGN KEY (
			`source_no` -- source_no
		)
		REFERENCES `logic` ( -- logic
			`original_no` -- original_no
		),
	ADD INDEX `FK_logic_TO_logic` (
		`source_no` -- source_no
	);

-- logic
ALTER TABLE `logic`
	ADD CONSTRAINT `FK_user_info_TO_logic` -- FK_user_info_TO_logic
		FOREIGN KEY (
			`user_id` -- user_id
		)
		REFERENCES `user_info` ( -- user_info
			`user_id` -- user_id
		),
	ADD INDEX `FK_user_info_TO_logic` (
		`user_id` -- user_id
	);

-- evaluation_project
ALTER TABLE `evaluation_project`
	ADD CONSTRAINT `FK_project_TO_evaluation_project` -- project -> evaluation_project
		FOREIGN KEY (
			`project_no` -- project_no
		)
		REFERENCES `project` ( -- project
			`project_no` -- project_no
		);