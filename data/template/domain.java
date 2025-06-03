@Entity
@Table(name = "movies")
@Data
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long movieId;

    private String movieName;

    private Boolean movieStatus;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private String remarks;
}
