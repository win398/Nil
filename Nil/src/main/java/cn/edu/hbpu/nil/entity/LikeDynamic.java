package cn.edu.hbpu.nil.entity;

import lombok.Getter;
import lombok.Setter;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Getter
@Setter
@Document("likeDynamic")
public class LikeDynamic {
    private ObjectId id;
    private Long userId;
    private Long dynamicId;
    private LocalDateTime createdTime;
}
