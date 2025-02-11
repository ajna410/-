SELECT
    t.group AS group_type,
    COUNT(DISTINCT u.user_id) AS user_count,
    COUNT(DISTINCT cl.user_id) * 1.0 / COUNT(DISTINCT u.user_id) AS call_coverage_rate,
    AVG(cl.call_duration) AS avg_call_duration
FROM
    users u
LEFT JOIN
    call_logs cl ON u.user_id = cl.user_id
LEFT JOIN
    teachers t ON u.experience_teacher_id = t.teacher_id
GROUP BY
    t.group;

SELECT
    t.group AS group_type,
    COUNT(DISTINCT r.user_id) * 1.0 / COUNT(DISTINCT u.user_id) AS renewal_rate
FROM
    users u
LEFT JOIN
    renewals r ON u.user_id = r.user_id AND r.renewal_status = 1
LEFT JOIN
    teachers t ON u.experience_teacher_id = t.teacher_id
GROUP BY
    t.group;