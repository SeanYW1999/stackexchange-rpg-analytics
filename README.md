# RelationalRebels：RPG Stack Exchange 數據分析專案
# RelationalRebels: RPG Stack Exchange Analytics

## 專案簡介 Project Overview
**中文：**  
本專案針對 RPG Stack Exchange（rpg.stackexchange.com）資料庫進行深度分析，探討 **用戶行為、聲譽與徽章機制、熱門遊戲討論趨勢**，以及 **跨地理區域的遊戲偏好差異**。

**English:**  
This project analyzes the RPG Stack Exchange database, focusing on **user behavior**, **reputation & badge mechanisms**, **popular game discussion trends**, and **geographic differences in system preferences**.

---

## 資料概況 Dataset
- **時間範圍 / Time span:** 2010-08-19 ~ 2024-03-31  
- **規模 / Scale:** ~66,957 users, ~164,202 posts  
- **資料表 / Tables (8):** Badges, Comments, PostHistory, PostLinks, Posts, Tags, Users, Votes  
- **注意 / Note:** 原始資料缺乏完整外鍵約束，分析主要透過 `UserId`、`PostId`、`TagId` 等共同欄位進行 join。

---

## 核心分析目標 Goals
1) **貢獻與回報 / Contribution & Reward**  
   以 `PostHistoryTypeId=2`（具實質內容的初始發文）衡量貢獻度，分析與 `Reputation` 的關聯。  
2) **榮譽體系 / Badge System**  
   徽章（Badges）分布與分級（Class 1–3），以及其與聲譽/曝光（Views）的關係。  
3) **市場趨勢 / Trend Over Time**  
   近五年主流 RPG 系統的討論度（發文量、瀏覽量）變化與異常波動。  
4) **全球視野 / Geography & Preferences**  
   清理 `Users.Location`，比較不同國家/洲別的玩家與遊戲偏好差異。

---

## 主要發現 Key Findings
### 1) 內容產出與聲譽高度連動
- 指標：`PostHistoryTypeId=2`  
- 結果：發文數與聲譽高度正相關（r ≈ 0.9241）

### 2) 徽章與影響力的關係
- 徽章數 vs 聲譽：r ≈ 0.949  
- 金徽章（Class 1） vs 總徽章：r ≈ 0.812  
- 徽章數 vs 瀏覽數（Views）：r ≈ 0.766  

### 3) 熱門遊戲五年趨勢與異常
- 主導系統：Dungeons & Dragons（D&D）與 Pathfinder 佔據主要討論量  
- 近五年多數系統討論度（發文/瀏覽）下降，可能與活躍用戶成長放緩相關（以註冊/活躍指標估算）  
- 例外：Dungeon World 在 2021 年瀏覽量突增，與「GM Techniques」相關討論升溫高度關聯  

### 4) 全球分布與偏好差異
- 清理 Location 後：18,968 位可用戶、65 個國家  
- 美國用戶約占 45% 為最大來源國  
- 洲際偏好：D&D 各洲皆主流；Pathfinder 在亞洲/大洋洲相對更突出；Shadowrun 在歐洲/大洋洲占比更高

---

## 專案結構 Project Structure
```text
.
├─ data/
│  ├─ raw/                  # 原始資料（可選；避免 commit 大檔）
│  └─ processed/            # 清理/派生資料（可重現分析用）
├─ sql/
│  ├─ 00_schema_notes.sql   #（可選）表結構/索引/備註
│  ├─ 10_user_posts.sql     # 用戶×貼文/聲譽分析
│  ├─ 20_badges.sql         # 徽章分析
│  ├─ 30_trends.sql         # 遊戲趨勢分析
│  └─ 40_geo.sql            # 地理清理與偏好差異
├─ notebooks/
│  ├─ 01_eda.ipynb          # EDA（探索性分析）
│  ├─ 02_models.ipynb       #（可選）統計/建模
│  └─ 03_figures.ipynb      # 圖表產出
├─ src/
│  ├─ clean_location.py     #（可選）location 清理腳本
│  └─ utils.*               # 共用函式
├─ figures/                 # 匯出的圖（png/svg）
├─ reports/                 # 報告（slides/pdf/markdown）
└─ README.md

