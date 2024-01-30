package com.movietickets.model;


public class Faq {
    private int id;
    private String question;
    private String answer;

    public Faq(int id, String question, String answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
    }

    // Getters and setters (if needed)
    public int getId() {
        return id;
    }
    public String getQuestion() {
        return question;
    }
    public String getAnswer() {
        return answer;
    }

    @Override
    public String toString() {
        return "FAQ{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}