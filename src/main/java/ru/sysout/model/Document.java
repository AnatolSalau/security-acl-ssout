package ru.sysout.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class Document implements IEntity {

    @Id
    private Integer id;

    private String content;

    public Document(String content) {
        this.content=content;
    }

    public Document(Integer id, String content) {
        this.id = id;
        this.content = content;
    }
}
