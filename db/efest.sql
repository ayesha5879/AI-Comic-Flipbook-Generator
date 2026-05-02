-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2025 at 01:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `efest`
--

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `prompt_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `prompt_id`, `image_name`) VALUES
(1, 1, 'chapter_1.jpg'),
(2, 1, 'chapter_2.jpg'),
(3, 1, 'chapter_3.jpg'),
(4, 1, 'chapter_4.jpg'),
(5, 1, 'chapter_5.jpg'),
(6, 1, 'chapter_6.jpg'),
(7, 2, 'chapter_6834e7e316c38.jpg'),
(8, 2, 'chapter_6834e7ee9c863.jpg'),
(9, 2, 'chapter_6834e7fbe1e1d.jpg'),
(10, 3, 'chapter_6834e9f5484b0.jpg'),
(11, 3, 'chapter_6834ea029a053.jpg'),
(12, 3, 'chapter_6834ea0fa8977.jpg'),
(13, 3, 'chapter_6834ea1ce3a83.jpg'),
(14, 3, 'chapter_6834ea2bbd42b.jpg'),
(15, 3, 'chapter_6834ea3b22219.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `prompt`
--

CREATE TABLE `prompt` (
  `id` int(11) NOT NULL,
  `api_response_id` varchar(255) DEFAULT NULL,
  `object_response` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prompt`
--

INSERT INTO `prompt` (`id`, `api_response_id`, `object_response`, `user_id`, `created_at`) VALUES
(1, 'chatcmpl-BbaKhEQa4RfJ1TMLDgvqOAAmA8QLN', '{\"id\":\"chatcmpl-BbaKhEQa4RfJ1TMLDgvqOAAmA8QLN\",\"object\":\"chat.completion\",\"created\":1748297499,\"model\":\"gpt-4-0613\",\"choices\":[{\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"Chapter 1: The Quest Begins\\n\\nOnce upon a time, there lived a man named Samuel. Samuel wasn\'t an ordinary man; he was an adventurer, always on the lookout for a thrilling escapade. One day, he came across a map leading to a hidden treasure on a deserted island. His heart pounded with excitement. The possibility of a new adventure and the allure of undiscovered treasure were too irresistible. So, he packed his bag, charted a small sailing boat, and set off on his quest.\\n\\nChapter 2: The Unexpected Encounter\\n\\nWhile on his journey, Samuel\'s boat was suddenly surrounded by a thick fog. Out of this fog emerged a massive pirate ship, adorned with a menacing skull and crossbones. The pirates, with their eye patches and scruffy beards, looked intimidating. Samuel was scared but remained calm, knowing he needed his wits about him to navigate this dangerous situation.\\n\\nChapter 3: The Pirate Captain\\n\\nThe pirate captain, a formidable figure named Blackbeard, approached Samuel. He demanded to know Samuel\'s purpose in their waters. Samuel, thinking quickly, explained he was on a fishing expedition. Blackbeard, suspicious of Samuel\'s vague story, decided to keep him aboard his ship as a prisoner until he could ascertain the truth.\\n\\nChapter 4: The Hidden Map\\n\\nWhile imprisoned, Samuel cleverly hid his treasure map, fearing it would be discovered. He used his time to observe the pirates and their routines, hoping to find an escape route. Unexpectedly, he found an ally in a young pirate named Jack, who was disillusioned with the harsh pirate life.\\n\\nChapter 5: The Escape Plan\\n\\nSamuel shared his story with Jack, showing him the hidden map and promising him a share of the treasure if he helped him escape. Jack agreed, and together they devised a daring plan. Using the distractions from a raucous pirate celebration, they managed to slip away unnoticed, stealing a small boat in the process.\\n\\nChapter 6: The Treasure\\n\\nReturning to their course, they eventually reached the deserted island. They followed the map\'s instructions and, to their delight, unearthed a chest full of gleaming gold and precious jewels. As promised, Samuel shared the treasure with Jack, and they returned home, richer not just in material wealth but also in the incredible story of their adventure.\\n\\nIn the end, Samuel had set out looking for a treasure hunt, but he came across pirates, a potential danger that turned into an unexpected friendship and an adventure of a lifetime.\",\"refusal\":null,\"annotations\":[]},\"logprobs\":null,\"finish_reason\":\"stop\"}],\"usage\":{\"prompt_tokens\":44,\"completion_tokens\":510,\"total_tokens\":554,\"prompt_tokens_details\":{\"cached_tokens\":0,\"audio_tokens\":0},\"completion_tokens_details\":{\"reasoning_tokens\":0,\"audio_tokens\":0,\"accepted_prediction_tokens\":0,\"rejected_prediction_tokens\":0}},\"service_tier\":\"default\",\"system_fingerprint\":null}', 5, '2025-05-27 03:12:04'),
(2, 'chatcmpl-BbaNRm3qSed3Y95E9kH1IrKOMfOsD', '{\"id\":\"chatcmpl-BbaNRm3qSed3Y95E9kH1IrKOMfOsD\",\"object\":\"chat.completion\",\"created\":1748297669,\"model\":\"gpt-4-0613\",\"choices\":[{\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"Chapter 1: The Desire\\nIn the heart of London, lived a man named Edward, known for his adventurous spirit and insatiable curiosity. Edward was obsessed with a particular treasure, the Golden Eye of Neptune, a jewel rumored to hold mystical powers. For years, he collected maps, studied old texts, and prepared for the day when he would embark on a journey to find this legendary treasure.\\n\\nChapter 2: The Journey Begins\\nEdward finally set sail towards the Caribbean, the region where the Golden Eye of Neptune was rumored to be hidden. He had a reliable crew, a sturdy ship, and his unyielding determination. Days turned into weeks, and weeks into months, but Edward remained steadfast, navigating through perilous waters and enduring treacherous storms.\\n\\nChapter 3: The Unexpected Encounter\\nOne day, while en route to an uncharted island, Edward\'s ship was intercepted by a group of pirates led by the infamous Captain Blackbeard. The pirates demanded the surrender of Edward\'s maps and treasures. However, Edward, being a brave man, refused to give up so easily.\\n\\nChapter 4: The Clash \\nA fierce battle ensued between Edward\\u2019s crew and the pirates. Edward fought bravely, but the pirates had the upper hand. In the heat of battle, Edward was captured and taken prisoner by Blackbeard. This unexpected turn of events put Edward\\u2019s quest for the Golden Eye of Neptune in jeopardy.\\n\\nChapter 5: The Escape\\nLocked in the pirate ship\'s hold, Edward realized he had to outsmart the pirates to continue his quest. He managed to pick the lock of his cell and stealthily move past the sleeping pirates. He stole one of their smaller boats and a map, and in the cloak of the night, escaped from the pirate ship.\\n\\nChapter 6: The Unending Quest\\nEdward\'s experience with the pirates left him stronger and more determined. Using the stolen map, he resumed his treasure hunt. The Golden Eye of Neptune was still out there, and Edward knew he had to find it before the pirates did. Thus, the man\\u2019s quest for treasure continued, a journey filled with dangers, pirates and the promise of unimaginable wealth.\",\"refusal\":null,\"annotations\":[]},\"logprobs\":null,\"finish_reason\":\"stop\"}],\"usage\":{\"prompt_tokens\":44,\"completion_tokens\":442,\"total_tokens\":486,\"prompt_tokens_details\":{\"cached_tokens\":0,\"audio_tokens\":0},\"completion_tokens_details\":{\"reasoning_tokens\":0,\"audio_tokens\":0,\"accepted_prediction_tokens\":0,\"rejected_prediction_tokens\":0}},\"service_tier\":\"default\",\"system_fingerprint\":null}', 5, '2025-05-27 03:14:46'),
(3, 'chatcmpl-BbaVrlwY1Q5RnTEzaXR0YdfwDYF2J', '{\"id\":\"chatcmpl-BbaVrlwY1Q5RnTEzaXR0YdfwDYF2J\",\"object\":\"chat.completion\",\"created\":1748298191,\"model\":\"gpt-4-0613\",\"choices\":[{\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"Chapter 1: The Spark of Adventure\\n\\nOnce there was an adventurous man named Eliot. He had grown up reading stories about hidden treasures and dreamed of embarking on a real treasure hunt. One day, he discovered an ancient map in his grandfather\'s attic. The map was adorned with strange symbols and markings, leading to a mysterious island. Eliot\'s heart raced with excitement; he knew he was about to start his life\'s greatest adventure.\\n\\nChapter 2: The Mysterious Island \\n\\nEliot embarked on his journey, sailing through the treacherous seas towards the mysterious island. As he navigated, he studied the map and the strange symbols, trying to decipher their meaning. After days of sailing, he finally spotted the island, shrouded in mist and mystery. His heart pounded as he anchored his small boat and set foot on the island, ready to unearth its secrets.\\n\\nChapter 3: The Unexpected Encounter\\n\\nAs Eliot ventured deeper into the island, he heard raucous laughter and the clinking of mugs. He stealthily followed the noise and came across a camp of boisterous pirates. They were celebrating, unaware of Eliot\'s presence. He watched them from a safe distance, realizing that he was not the only one interested in the island\'s treasure.\\n\\nChapter 4: The Pirates\\u2019 Secret\\n\\nEliot observed the pirates, hoping to learn something about the treasure. To his surprise, he saw them discussing another map, strikingly similar to his. He realized the pirates were also searching for the same treasure. He decided to steal their map, hoping it held clues that his did not.\\n\\nChapter 5: The Treasure Unearthed\\n\\nUsing both maps, Eliot was able to piece together the final path to the treasure. He had to cross a treacherous ravine, solve a cryptic puzzle, and brave a dark cave. Finally, he found the treasure, a chest gleaming with gold and precious gems. As he reached out to touch it, he heard the pirates approaching.\\n\\nChapter 6: The Great Escape\\n\\nEliot quickly grabbed a handful of gems and gold before the pirates arrived. He ran towards his boat, the pirates hot on his heels. He rowed as fast as he could, the pirates\\u2019 curses echoing behind him. As he sailed away from the island, he could not help but smile. He may not have gotten all the treasure, but he had the adventure of a lifetime, just like in his childhood stories.\",\"refusal\":null,\"annotations\":[]},\"logprobs\":null,\"finish_reason\":\"stop\"}],\"usage\":{\"prompt_tokens\":44,\"completion_tokens\":507,\"total_tokens\":551,\"prompt_tokens_details\":{\"cached_tokens\":0,\"audio_tokens\":0},\"completion_tokens_details\":{\"reasoning_tokens\":0,\"audio_tokens\":0,\"accepted_prediction_tokens\":0,\"rejected_prediction_tokens\":0}},\"service_tier\":\"default\",\"system_fingerprint\":null}', 5, '2025-05-27 03:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `date`) VALUES
(5, 'Usman', 'Abid', 'usmanabid0231@gmail.com', '4864848406', '5a1d171f5944343b2ac2f5899abb368293ffc178d6bc480a0d388a2b88e383af', '2025-05-18 14:01:41'),
(7, 'Ayesha', 'abc', 'ayesha@youronlineconversation.com', '4864848406', '5a1d171f5944343b2ac2f5899abb368293ffc178d6bc480a0d388a2b88e383af', '2025-05-18 19:28:10'),
(8, 'Bilal', 'Abid', 'bilal@gmail.com', '123', '5a1d171f5944343b2ac2f5899abb368293ffc178d6bc480a0d388a2b88e383af', '2025-05-27 01:30:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prompt_id` (`prompt_id`);

--
-- Indexes for table `prompt`
--
ALTER TABLE `prompt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `prompt`
--
ALTER TABLE `prompt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`prompt_id`) REFERENCES `prompt` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
