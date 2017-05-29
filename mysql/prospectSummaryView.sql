CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `prospectSummary` AS
    SELECT 
        `p`.`name` AS `name`,
        COUNT(`psm`.`supplierId`) AS `count(psm.supplierId)`,
        SUM(`psm`.`spendAmount`) AS `sum(psm.spendAmount)`,
        SUM(`psm`.`poCount`) AS `sum(psm.poCount)`,
        SUM(`psm`.`invoiceCount`) AS `sum(psm.invoiceCount)`
    FROM
        (`prospects` `p`
        JOIN `prospectSupplierMatch` `psm`)
    WHERE
        (`p`.`prospectId` = `psm`.`prospectId`)
    GROUP BY `psm`.`prospectId`