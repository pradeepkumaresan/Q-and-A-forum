CREATE TABLE "question" (
	"id" serial NOT NULL,
	"description" varchar(2000) NOT NULL,
	"likes" integer NOT NULL,
	"user_id" integer NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "question_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "answer" (
	"id" serial NOT NULL,
	"description" varchar(2000) NOT NULL,
	"likes" integer NOT NULL,
	"question_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "answer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "comment" (
	"id" serial NOT NULL,
	"description" varchar(2000) NOT NULL,
	"likes" integer NOT NULL,
	"question_id" integer,
	"answer_id" integer,
	"user_id" integer NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "comment_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "tag" (
	"id" serial NOT NULL,
	"name" varchar(256) NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "tag_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user" (
	"id" serial NOT NULL,
	"first_name" varchar(500),
	"last_name" varchar(500),
	"description" varchar(2000),
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "tag_question_mapping" (
	"id" serial NOT NULL,
	"question_id" integer NOT NULL,
	"tag_id" integer NOT NULL,
	"modified_at" TIMESTAMP NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	CONSTRAINT "tag_question_mapping_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "question" ADD CONSTRAINT "question_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "answer" ADD CONSTRAINT "answer_fk0" FOREIGN KEY ("question_id") REFERENCES "question"("id");
ALTER TABLE "answer" ADD CONSTRAINT "answer_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "comment" ADD CONSTRAINT "comment_fk0" FOREIGN KEY ("question_id") REFERENCES "question"("id");
ALTER TABLE "comment" ADD CONSTRAINT "comment_fk1" FOREIGN KEY ("answer_id") REFERENCES "answer"("id");
ALTER TABLE "comment" ADD CONSTRAINT "comment_fk2" FOREIGN KEY ("user_id") REFERENCES "user"("id");



ALTER TABLE "tag_question_mapping" ADD CONSTRAINT "tag_question_mapping_fk0" FOREIGN KEY ("question_id") REFERENCES "question"("id");
ALTER TABLE "tag_question_mapping" ADD CONSTRAINT "tag_question_mapping_fk1" FOREIGN KEY ("tag_id") REFERENCES "tag"("id");






