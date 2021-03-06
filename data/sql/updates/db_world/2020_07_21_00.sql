-- DB update 2020_07_18_00 -> 2020_07_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2020_07_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2020_07_18_00 2020_07_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1590935860785056000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1590935860785056000');
/*
 * Zone: Durotar
 * Update by Knindza | <www.azerothcore.org>
 * Copyright (C) <www.shadowburn.net> & <www.lichbane.com>
*/

/* SMARTSCRIPT */
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3195;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 3195);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3195, 0, 0, 0, 0, 0, 100, 0, 2300, 3900, 11600, 14200, 11, 14873, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Burning Blade Thug - In Combat - Cast \'14873\'');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3121;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 3121);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3121, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 11, 17498, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Durotar Tiger - On Aggro - Cast \'17498\'');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3126;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 3126);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3126, 0, 0, 0, 0, 0, 100, 1, 2600, 3200, 0, 0, 11, 744, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Armored Scorpid - In Combat - Cast \'744\' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
