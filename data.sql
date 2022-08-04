drop database quanlycuahang;
create database quanlycuahang;
use quanlycuahang;
create table users(
    user_id int not null auto_increment primary key,
    name varchar(1000) not null,
    password varchar(1000),
    dob date,
    email varchar(1000),
    phone varchar(10),
    address varchar(1000)
);

create table inventories(
    inventory_id int not null auto_increment primary key,
    type int not null,
    number int
);

create table products (
    product_id int not null auto_increment primary key,
    name varchar(1000) not null,
    description varchar(1000),
    price int not null,
    expiry_date date,
    brand varchar(1000),
    category varchar(1000),
    image varchar(1000),
    number int,
    type int -- type 0: skincare , type 1: makeup
);

create table payment_card (
    payment_card_id int not null auto_increment primary key,
    user_id int,
    foreign key (user_id) references users(user_id),
    name_of_bank varchar(1000),
    card_number varchar(1000)
);

create table orders (
    order_id int not null auto_increment primary key,
    user_id int not null,
    foreign key (user_id) references users(user_id),
    product_id int not null,
    foreign key (product_id) references products(product_id),
    number int
);

create table payments (
    payment_id int not null auto_increment primary key,
    order_id int not null,
    foreign key (order_id) references orders(order_id),
    payment_card_id int,
    foreign key (payment_card_id) references payment_card(payment_card_id),
    total int not null,
    status int not null
);

-- status 0 : unpaid, status 1 : paid
INSERT INTO
    inventories (type, number)
VALUES
    (0, 0),
    (1, 0);

INSERT INTO
    products (
        name,
        brand,
        category,
        price,
        description,
        image,
        type,
        number
    )
VALUES
    (
        'Plum Plump Hyaluronic Acid Moisturizer',
        'Glow Recipe',
        'Night Creams',
        100000,
        'This lightweight whipped gel cream hydrates and visibly balances unpredictable skin and delivers a dewy-looking glow. It features plum, multi-molecular-weight hyaluronic acid and polyglutamic acid for long-lasting, visibly skin-balancing hydration. Plus, ice willowherb helps to balance oil and support the microbiome. Best for combination skin.',
        'https://www.sephora.com/productimages/sku/s2535128-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Lotus Anti-Aging Night Moisturizer',
        'fresh',
        'Night Creams',
        100000,
        'This nighttime moisturizer helps your skin recover while it''s most receptive to nourishment—so you wake up with a brighter, more rested look. Antioxidant-rich super lotus supports a strong skin barrier and reduces the look of fine lines, while peach leaf extract purifies and visibly revives your skin overnight.',
        'https://www.sephora.com/productimages/sku/s2175560-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Ultra Facial Overnight Hydrating Face Mask with 10.5% Squalane',
        'Kiehl''s Since 1851',
        'Night Creams',
        100000,
        'This innamesively hydrating face mask in a transformative balm-to-oil texture melts into skin to help replenish and strengthen skins moisture barrier and prevent excess overnight moisture loss. Wake up to nourished, flake-free, healthy-looking skin.',
        'https://www.sephora.com/productimages/sku/s2530863-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Watermelon + AHA Glow Sleeping Mask',
        'Glow Recipe',
        'Night Creams',
        100000,
        'This brighnameing, glow-boosting hybrid is formulated with AHAs to smooth the surface of the skin by banishing dead surface cells. Hyaluronic acid binds moisture to the skin for and ultra-hydrated complexion by morning. Use as a pillow-proof sleeping mask to smooth and hydrate overnight or as a wash-off mask for an instant glow.',
        'https://www.sephora.com/productimages/sku/s1955764-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Lavender Water Sleeping Mask',
        'LANEIGE',
        'Night Creams',
        100000,
        'Become an overnight sensation with this famous sleeping mask. The unique formula features Hydro Ionized Mineral Water™, which floods skin with moisture, while hunza apricot and evening primrose extracts help brighname and purify. While its working, enjoying LANEIGE''s exclusive Sleepscent™ to help impart a restful sleep so you can wake up looking refreshed.',
        'https://www.sephora.com/productimages/sku/s2167781-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Aqua Bomb Sleeping Mask',
        'belif',
        'Night Creams',
        100000,
        'The memory formula of this unique jelly-pudding sleeping mask blankets and wraps around the contours of skin with a refreshing layer of innamese hydration. Born from the DNA of belifs bestselling Aqua Bomb moisturizer, this overnight mask rejuvenates and replenishes dull, dry, and fatigued skin with explosive hydration for smoother, more supple-looking skin and a healthy glow. Filled with ultra-hydrating herbs like skin-soothing Scottish heather and ladys mantle, the pillow-proof formula is lightweight and absorbs quickly for fuss-free hydration.',
        'https://www.sephora.com/productimages/sku/s2111649-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Avocado Melt Retinol Eye Cream',
        'Glow Recipe',
        'Night Creams',
        100000,
        'Ponamet, encapsulated ingredients like retinol, hyaluronic acid, and niacinamide time release throughout all hours of the night, while avocado hydrates and nourishes, and coffeeberry helps to brighname and depuff the delicate under-eye area. The result is brighter, smoother, more awake-looking eyes by morning. This product has been ophthalmologist tested and dermatologist tested.',
        'https://www.sephora.com/productimages/sku/s2266708-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        '100% Organic Cold-Pressed Rose Hip Seed Oil',
        'The Ordinary',
        'Face Oils',
        100000,
        'Rose Hip Seed Oil is completely unrefined and imparts a natural scent, partly due to its high omega fatty acid connamet. This scent is not an indication of rancidity. Rose Hip Seed Oil that does not have a scent is refined and offers reduced benefits. It comes in UV-protective packaging.',
        'https://www.sephora.com/productimages/sku/s2031417-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Squalane + Vitamin C Rose Firming Oil',
        'Biossance',
        'Face Oils',
        100000,
        'A luxurious facial oil with Damascus rose oil, vitamin C to visibly brighname, and chios crystal oil that’s known to boost radiance and firm the look of skin. The final step in your skincare routine to lock in moisture and deliver a glowing complexion.',
        'https://www.sephora.com/productimages/sku/s2382166-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Collagen Superfusion Firming & Plumping Facial Oil',
        'Charlotte Tilbury',
        'Face Oils',
        100000,
        'This facial oil works alongside the skin’s natural oils to help balance the look of the complexion, lock in moisture by strengthening the skin’s barrier, and help support the feel of soft and supple skin.',
        'https://www.sephora.com/productimages/sku/s2551950-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Honey Grail Ultra-Hydrating Face Oil',
        'Farmacy',
        'Face Oils',
        100000,
        'This multitasking miracle-worker is packed with essential fatty acids and Farmacy''s proprietary honey, sea buckthorn, and a five-flower oil blend for glowing skin without a greasy residue. It can be used alone, mixed in with your favorite moisturizer, or blended with foundation.',
        'https://www.sephora.com/productimages/sku/s2231975-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'U.F.O. Salicylic Acid BHA Acne Treatment Face Oil',
        'Sunday Riley',
        'Face Oils',
        200000,
        'A quick-absorbing, medicated dry oil to clear congested pores, treat and prevent acne, and smooth the appearance of fine lines and wrinkles for clearer, smoother skin.',
        'https://www.sephora.com/productimages/sku/s1842251-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Ultra Repair® Oat & Hemp Seed Dry Oil',
        'First Aid Beauty',
        'Face Oils',
        200000,
        'This antioxidant-rich facial oil is formulated with a blend of 16 cold-pressed active botanicals including cannabis sativa seed oil, rich in omegas and fatty acids, and colloidal oatmeal. Together they work to help calm and soothe dry, distressed skin. Arnica Montana flower extract and borage seed oil help support the skin’s natural healing process. This unique dry oil absorbs into skin so it will never leave a greasy after-feel.',
        'https://www.sephora.com/productimages/sku/s2166338-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Superfood Antioxidant Cleanser',
        'Youth To The People',
        'Face Wash & Cleansers',
        200000,
        'This daily green juice face cleanser is formulated with a proprietary superfood-extract blend of kale, spinach, and green tea. Effective for both single and double cleansing, this antioxidant-rich formula is sulfate- and alcohol-free to cleanse skin without drying for optimal pH balance.',
        'https://www.sephora.com/productimages/sku/s1863588-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'The Deep Cleanse Gentle Exfoliating Cleanser',
        'Tatcha',
        'Face Wash & Cleansers',
        200000,
        'A daily gel cleanser with natural fruit exfoliant that thoroughly but gently lifts impurities and unclogs pores while leaving skin soft and hydrated.',
        'https://www.sephora.com/productimages/sku/s2468916-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Acne+ 2% BHA + Azelaic Acid + Niacinamide + AHA Cleanser',
        'Skinfix',
        'Face Wash & Cleansers',
        200000,
        'Powerful acne cleanser with salicylic, azelaic and glycolic acids reduces breakouts and minimizes excess sebum that can clog pores. Supports healthy skin pH levels for a balanced surface microbiome. Formulated without known triggers of Malassezia and gentle enough for daily use.',
        'https://www.sephora.com/productimages/sku/s2480838-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Blueberry Bounce Gentle Cleanser',
        'Glow Recipe',
        'Face Wash & Cleansers',
        200000,
        'This cleanser delivers all the antioxidant-rich benefits of blueberries. The gentle formula is packed with nourishing oils to remove makeup with minimal rubbing, while hyaluronic acid and AHAs help improve the look of pores. Skin is left clear, radiant, and glowy.',
        'https://www.sephora.com/productimages/sku/s2131803-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Fulvic Acid Brighnameing Cleanser',
        'The INKEY List',
        'Face Wash & Cleansers',
        200000,
        'Containing 0.5% Fulvic Acid, this gentle formula cleanses the skin removing makeup—even eye makeup—while enhancing exfoliation to reveal brighter, more radiant-looking skin. This cleanser also has calming benefits and works to promote a more even skin tone.',
        'https://www.sephora.com/productimages/sku/s2425163-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Clean Skin Gel Cleanser with Prebiotics',
        'SEPHORA COLLECTION',
        'Face Wash & Cleansers',
        200000,
        'This gel cleanser is formulated with 98 percent natural-origin ingredients that remove makeup and visible impurities; it also tones, cleanses, and soothes face, eye area, and neck.',
        'https://www.sephora.com/productimages/sku/s2457976-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Hyaluronic Acid Cleanser',
        'The INKEY List',
        'Face Wash & Cleansers',
        200000,
        'Great for all skin types (especially dryer skin), this unique cleanser quickly and thoroughly hydrates for up to 48 hours after use, supporting skin-barrier health and optimizing skin-pH levels.',
        'https://www.sephora.com/productimages/sku/s2530749-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Special Cleansing Gel',
        'Dermalogica',
        'Face Wash & Cleansers',
        200000,
        'After using the Precleanse Cleansing Oil (sold separately), double-cleanse with this soap-free, naturally foaming cleanser, which leaves your skin feeling smooth and clean. Lightweight and gentle enough for daily use, this formula washes away toxins and debris without a drying or stripping effect.',
        'https://www.sephora.com/productimages/sku/s2002103-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'CLEAR Pore Normalizing Acne Cleanser',
        'Paula''s Choice',
        'Face Wash & Cleansers',
        200000,
        'This ultra-gentle acne cleanser works quickly to break down debris and excess oil that can clog pores and lead to breakouts. It rinses away without any residue, leaving skin feeling refreshed and balanced—never tight or uncomfortable. Use it alone or as a part of a double-cleanse routine.',
        'https://www.sephora.com/productimages/sku/s2421261-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Beste™ No. 9 Jelly Cleanser',
        'Drunk Elephant',
        'Face Wash & Cleansers',
        200000,
        'With a unique blend of mild surfactants and makeup-dissolving emollients, this gentle cleanser is formulated at an ideal, non-stripping pH level of 5.5. Free of SLS, fragrance, essential oils, and silicones, Beste™ No. 9 is appropriate for all skin.',
        'https://www.sephora.com/productimages/sku/s2022598-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Green Clean Makeup Removing Cleansing Balm',
        'Farmacy',
        'Makeup Removers',
        300000,
        'This holy grail cleansing balm quickly and effortlessly melts away makeup (including long-wearing and stubborn eye makeup) without stripping your skin or leaving any residue behind. Transforming from a sorbet-like balm to a milky lather, it seamlessly removes sunscreen, visible impurities, and excess oil while gently exfoliating skin to leave your complexion hydrated and smooth.',
        'https://www.sephora.com/productimages/sku/s1899103-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Papaya Sorbet Smoothing Enzyme Cleansing Balm & Makeup Remover',
        'Glow Recipe',
        'Makeup Removers',
        300000,
        'This sorbet-like cleansing balm harnesses papaya enzymes to gently resurface skin while dissolving makeup, dirt, and oil, creating a baby-soft canvas for skincare and makeup. It is also formulated with antioxidant-rich blueberry, soothing apricot kernel oil, and moisturizing camellia seed oil to leave skin looking clean, bouncy, and glowing.',
        'https://www.sephora.com/productimages/sku/s2371516-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Precleanse Cleansing Oil',
        'Dermalogica',
        'Makeup Removers',
        300000,
        'An iconic formula from the brand known for the double cleanse, the Precleanse Cleansing Oil is a blend of lightweight plant-based oils that melt away layers of sebum (oil), SPF, waterproof makeup, and other impurities that build up on skin throughout the day. Gentle enough for the eyes, this formula will even remove eyelash glue.',
        'https://www.sephora.com/productimages/sku/s2002079-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Hydro Ungrip Makeup Remover + Cleansing Water',
        'MILK MAKEUP',
        'Makeup Removers',
        300000,
        'This micellar water combines blue agave extract, the all-star ingredient in Milk Makeup’s bestselling Hydro Grip Primer, with micellar technology to create a hydrating makeup remover that gently lifts away makeup, dirt, and visible impurities. It is oil-free and fragrance-free.',
        'https://www.sephora.com/productimages/sku/s2572881-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'E-Rase™ Milki Micellar Water',
        'Drunk Elephant',
        'Makeup Removers',
        300000,
        'With ultra-mild micelles, replenishing fatty acids, and antioxidant-rich plant oils, E-Rase™ nourishes skin while dissolving away makeup and dirt, is barrier-supportive, and may be used anytime you need a quick skin refreshment. E-Rase™ is gentle enough to be used all over, including eyes and lips, and is formulated at a pH of 5.0.',
        'https://www.sephora.com/productimages/sku/s2382489-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Take The Day Off Cleansing Oil Makeup Remover',
        'CLINIQUE',
        'Makeup Removers',
        300000,
        'A cleansing oil to immediately dissolve nameacious face makeup, oil, and impurities.',
        'https://www.sephora.com/productimages/sku/s1583426-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Squalane + Antioxidant Makeup Removing Cleansing Oil',
        'Biossance',
        'Makeup Removers',
        300000,
        'This lightweight cleansing oil gently lifts away makeup and impurities, then rinses completely clean with water. It’s formulated with nourishing antioxidants to help boost radiance and sugarcane-derived, sustainable squalane oil to help skin feel refreshed, cushiony-soft, and moisturized.',
        'https://www.sephora.com/productimages/sku/s2051902-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        '2-in-1 Cleansing Oil + Makeup Remover',
        'First Aid Beauty',
        'Makeup Removers',
        300000,
        'This sulfate-free, hybrid formula starts as a gel-oil texture that effortlessly dissolves visible impurities and makeup, including long-wear and waterproof formulas. It transforms into a foam when combined with water to deliver a gentle double cleanse that leaves skin completely clean without feeling dry or stripped.',
        'https://www.sephora.com/productimages/sku/s2532034-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Rinse-Off Eye Makeup Solvent',
        'CLINIQUE',
        'Makeup Removers',
        300000,
        'This unique formula quickly removes all eye makeup, from lashes to brows. Perfect for quick makeup changes, touchups, and repairs, it cleans easily without disturbing other makeup. Blur-free and sting-free, this ophthalmologist-tested product is non-irritating and oil-free. It requires no rubbing and is ideal for all skin types.',
        'https://www.sephora.com/productimages/sku/s48041-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Bi-Facil Double-Action Eye Makeup Remover',
        'Lancôme',
        'Makeup Removers',
        300000,
        'This no-rinse, gentle eye-makeup remover cleanses and nourishes lashes without tugging. The lipid phase effortlessly lifts eye makeup while the water phase uses emollients to gently remove makeup residue. The formula is suitable for sensitive skin and eyes.',
        'https://www.sephora.com/productimages/sku/s534628-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Soy pH-Balanced Hydrating Face Wash',
        'fresh',
        'Makeup Removers',
        300000,
        'ur #1 hydrating face wash with soy proteins deeply cleanses pores and removes makeup while maintaining skin’s pH and increasing hydration—even after you rinse. Plus, the non-stripping formula is proven effective on all ages, genders, skin types, and tones.',
        'https://www.sephora.com/productimages/sku/s2534675-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Slick Type Clean Makeup Removing Cleansing Balm with Olive Oil',
        'ITEM Beauty By Addison Rae',
        'Makeup Removers',
        300000,
        'This scoopable cleansing balm visibly melts away makeup and dirt without stripping skin. It is enriched with natural emollients to help moisturize skin.',
        'https://www.sephora.com/productimages/sku/s2485001-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'La Mousse OFF/ON Foaming Face Cleanser',
        'Dior',
        'Makeup Removers',
        300000,
        'Composed of 90 percent natural-origin ingredients, this gentle cleanser is infused with purifying water lily from the Dior gardens. With a light, airy texture, this two-in-one foaming facial cleanser delivers cleansing and skincare. OFF means purifying, ON means soothing.',
        'https://www.sephora.com/productimages/sku/s2552693-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Watermelon Glow PHA + BHA Pore-Tight Toner',
        'Glow Recipe',
        'Toners',
        300000,
        'Suitable for all skin types, this bouncy, alcohol-free toner is made with PHA and willow bark (a natural form of BHA) to unclog pores and hydrate skin. Watermelon, hyaluronic acid, and cactus water combine to smooth and innamesely hydrate for a visibly glowing, pore-tight complexion. Cactus water and cucumber add a herbal scent with a fruity finish. 100% of profits* of this limited edition toner will be donated to nonprofit organizations empowering LGBTQIA+ youth globally.',
        'https://www.sephora.com/productimages/sku/s2348431-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Deep Sweep 2% BHA Pore Cleaning Toner with Moringa + Papaya',
        'Farmacy',
        'Toners',
        300000,
        'Powered by a salicylic acid, moringa water, and papaya enzyme blend, this refreshing, lightweight daily toner visibly reduces shine and minimizes the appearance of pores. It effectively exfoliates and cleanses, leaving skin looking smooth and healthy.',
        'https://www.sephora.com/productimages/sku/s2328359-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Mandelic Acid + Superfood Unity Exfoliant',
        'Youth To The People',
        'Toners',
        300000,
        'Suitable for all skin types, this multitasking solution brings together three gentle acids with kale, green tea, and licorice root to ease congestion, reduce the look of dark spots, and support (never strip) the skins moisture barrier. Its all the acids with none of the irritation.',
        'https://www.sephora.com/productimages/sku/s2450807-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Glow2OH™ Dark Spot Toner',
        'OLEHENRIKSEN',
        'Toners',
        300000,
        'This powerhouse face toner targets dark spots, fine lines, and wrinkles to visibly brighnames and smooth skin texture. At night, tone your skin post-cleansing, and you’ll be perfectly prepped for serum and moisturizer. Plus, with its lemon sugar scent and the tingle, you’ll be hooked from the very first swipe.',
        'https://www.sephora.com/productimages/sku/s2169431-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'SOS Daily Rescue Facial Spray',
        'Tower 28 Beauty',
        'Toners',
        300000,
        'This multihyphenate spray, powered by stable hypochlorous acid, helps to soothe and nourish stressed-out skin on the face and body (including visible blemishes and sunburns) while supporting the skin barrier. This product also has the National Eczema Association Seal of Acceptance™.',
        'https://www.sephora.com/productimages/sku/s2527844-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Ready Steady Glow Daily AHA Toner',
        'REN Clean Skincare',
        'Toners',
        300000,
        'Gentle enough for daily use, this skin-resurfacing toner is formulated with AHA and BHA that stimulate the skin to naturally exfoliate. Its lactic acid and willow bark extract work together to visibly smooth and tone skin as well as reduce the look of pores, while azelaic acid visibly brighnames and lighnames the appearance of hyperpigmentation.',
        'https://www.sephora.com/productimages/sku/s2046639-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Water Bank Blue Hyaluronic Exfoliating Toner',
        'LANEIGE',
        'Toners',
        300000,
        'This lightweight toner leaves skin extra-soft, visibly smooth, and ready to better absorb the rest of your skincare. PHA works to gently exfoliate while blue hyaluronic acid—fermented with deep sea algae and a 10-step microfiltration process—immediately absorbs for innamese hydration.',
        'https://www.sephora.com/productimages/sku/s2569846-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Glycolic Acid Exfoliating Toner',
        'The INKEY List',
        'Toners',
        300000,
        'Derived from sugar cane, this Glycolic Acid Toner works to unglue dead skin on the surface to help improve the overall look of skin texture and brightness. It’s formulated with 10 percent glycolic acid for maximum effect and five percent witch hazel to help control oil.',
        'https://www.sephora.com/productimages/sku/s2211530-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Skin Resolution Clean Exfoliating Acid Toner',
        'ROSE INC',
        'Toners',
        300000,
        'Harnessing a powerful combination of acids, this gentle and non-comedogenic toner clarifies pores without a moisture-stripping effect, leaving your skin visibly balanced, smooth, radiant, and perfectly primed for makeup.',
        'https://www.sephora.com/productimages/sku/s2488351-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Kombucha + 11% AHA Exfoliation Toner with Lactic Acid',
        'Youth To The People',
        'Toners',
        300000,
        'This powerful nighttime exfoliator smooths skin texture and relieves congestion. Humectants, lactic acid, and arginine work synergistically to maintain essential hydration, while kombucha black tea and tree bark ferments work as prebiotics to enhance the skin’s natural microbiome.',
        'https://www.sephora.com/productimages/sku/s2237063-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Daily Glow Toner with Niacinamide',
        'Charlotte Tilbury',
        'Toners',
        400000,
        'While most acid toners cant be used daily, Daily Glow Toner was formulated so that it can be used every day without the concern of irritation. Its acid-free, gentle, and suitable for sensitive skin. It leaves skin feeling gently exfoliated to reveal visibly glowing, glass-like skin.',
        'https://www.sephora.com/productimages/sku/s2569390-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Volcanic Clusters Pore Clearing Toner',
        'innisfree',
        'Toners',
        400000,
        'This lightweight toner is infused with Jeju Volcanic Clusters™ and has a unique bi-phase formula with silica micro-particles that cleanses impurities while helping absorb oil for a smooth, supple-looking complexion.',
        'https://www.sephora.com/productimages/sku/s2338341-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Ultra Facial Toner',
        'Kiehl''s Since 1851',
        'Toners',
        400000,
        'This soothing toner helps refine surface texture while providing the ideal preparation for Ultra Facial Cream or Moisturizer. It gently removes surface debris and remaining residue while hydrating and comforting skin. The non-alcohol formula is perfectly PH-balanced for optimal comfort.',
        'https://www.sephora.com/productimages/sku/s1988609-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Soft Reset AHA Exfoliating Solution',
        'Summer Fridays',
        'Toners',
        400000,
        'Formulated with a concentrated solution of 16 percent alpha hydroxy acids, including lactic and glycolic acid, this serum promotes cell turnover, visibly smoothing and refining the skin‘s texture overnight.',
        'https://www.sephora.com/productimages/sku/s2393643-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Hyaluronic Acid 2% + B5 Hydrating Serum',
        'The Ordinary',
        'Face Serums',
        400000,
        'This formulation combines low, medium, and high molecular weight hyaluronic acid, as well as a next-generation H.A. crosspolymer at a combined concentration of two percent for multi-depth hydration. This system is supported with the addition of B5 for enhanced hydration.',
        'https://www.sephora.com/productimages/sku/s2031375-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Triple Peptide + Cactus Hydrating + Firming Oasis Serum',
        'Youth To The People',
        'Face Serums',
        400000,
        'This skin-quenching serum combines the benefits of your daily hydrating, plumping, and firming treatments into a single step. It’s fragrance-free, non-sticky, and stacked with moisture-multiplying minerals, peptides, and nutrients that help create a healthy ecosystem for youthful skin to thrive.',
        'https://www.sephora.com/productimages/sku/s2536134-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Retinol Anti-Aging Serum',
        'The INKEY List',
        'Face Serums',
        400000,
        'A derivative of vitamin A, Retinol is the gold standard for skin renewal, helping to target the signs of ageing and promote a more even looking skin tone. Released slowly over a longer time period, this serum helps target the appearance of fine lines and wrinkles with less irritation risk.',
        'https://www.sephora.com/productimages/sku/s2211498-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Avocado Ceramide Redness Relief Serum',
        'Glow Recipe',
        'Face Serums',
        400000,
        'Calming ingredients like avocado, ceramide-5, rice milk, and allantoin visibly reduce redness and soothe irritated or sensitized skin. Skin barrier health is strengthened, resulting in more hydrated, resilient skin. This product has been dermatologist-tested and clinically proven to reduce redness over time.',
        'https://www.sephora.com/productimages/sku/s2450096-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Hyaluronic Acid Hydrating Serum',
        'The INKEY List',
        'Face Serums',
        400000,
        'Hyaluronic Acid Hydrating Serum is The INKEY List’s number one selling product. Hyaluronic acid is a powerful moisture-binding ingredient that works beneath the skin''s surface and can hold up to 1000 times its weight in water, drawing in innamese hydration to multiple layers of the skin.',
        'https://www.sephora.com/productimages/sku/s2211464-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        '15% Vitamin C and EGF Brighnameing Serum',
        'The INKEY List',
        'Face Serums',
        400000,
        'Ascorbyl Glucoside converts to pure vitamin C on the skin’s surface for an immediate glow and radiant-looking complexion, while naturally derived EGF (Epidermal Growth Factor) helps to stimulate skin cells, producing fresh-feeling, youthful-looking skin.',
        'https://www.sephora.com/productimages/sku/s2335594-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'B-Hydra™ Innamesive Hydration Serum with Hyaluronic Acid',
        'Drunk Elephant',
        'Face Serums',
        400000,
        'Formulated with biocompatible ingredients like provitamin B5, pineapple ceramide, and a lentil/apple/watermelon complex, this lightweight serum—which has a pH level of 5.7—delivers steady hydration all day as it visibly diminishes drabness, dryness, and fine lines. Your skin will appear healthier, brighter, and more youthful.',
        'https://www.sephora.com/productimages/sku/s1785856-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        '10% Waterless Vitamin C Serum',
        'Farmacy',
        'Face Serums',
        400000,
        'A 10% vitamin C serum that’s shown to visibly brighname, firm, and target the look of dark spots. 10% L-ascorbic acid, the purest form of vitamin C, is powered by a waterless technology for maximum stability and ponamecy until the very last drop. 1% alpha-arbutin and ferulic acid visibly even skin tone and reduce the look of hyperpigmentation, while upcycled tangerine peel hydrates and boosts moisture without irritation.',
        'https://www.sephora.com/productimages/sku/s2563583-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Truth Serum Vitamin C Serum',
        'OLEHENRIKSEN',
        'Face Serums',
        400000,
        'Truth Serum is like a daily multivitamin for the skin. Supercharged with True-C Complex™ and boosted with collagen, this powerful age-defying serum helps visibly even and firm, delivering all-day hydration. Enriched with orange and green tea extracts, this fast-absorbing, oil-free formula revives the complexion. Plus you’ll love the energizing citrus scent. This serum contains less than one percent synthetic fragrance and was rigorously tested for safety, toxicity, and allergens.',
        'https://www.sephora.com/productimages/sku/s2409159-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Squalane + Copper Peptide Rapid Plumping Serum',
        'Biossance',
        'Face Serums',
        400000,
        'Biossance’s Rapid Plumping Complex is a synergistic blend of three moisture-boosters: hyaluronic acid, polyglutamic acid, and squalane. It draws in moisture and floods skin with continuous hydration, while copper peptide encourages collagen production, so skin is left looking bouncy and plump.',
        'https://www.sephora.com/productimages/sku/s2536076-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Anti-Aging First Care Activating Serum',
        'Sulwhasoo',
        'Face Serums',
        400000,
        'One of Korea’s best kept beauty secrets is yours. This lightweight, skin-priming serum harnesses the power of five precious Korean herbs to visibly minimize signs of aging, hydrate, brighname, and firm your skin. Use it as the first step after cleansing, before toner, to enhance the absorption of the rest of your routine.',
        'https://www.sephora.com/productimages/sku/s2424893-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Indigo Overnight Repair Serum in Cream Treatment',
        'Tatcha',
        'Face Serums',
        400000,
        'At the end of the day, skin can look irritated or feel dry and tight due to pollution and environmental stressors. Soothe, hydrate, and help strengthen your skin with this hybrid serum and moisturizer treatment, which maximizes the nightly renewal process so you wake up with healthy-looking, radiant skin.',
        'https://www.sephora.com/productimages/sku/s2489755-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Amino Acids + B5',
        'The Ordinary',
        'Face Serums',
        400000,
        'This formula combines amino acids and vitamin B5 for hydrated, healthy-looking skin.',
        'https://www.sephora.com/productimages/sku/s2210615-main-zoom.jpg?imwidth=630',
        0,
        5
    ),
    (
        'Pore Clearing Clay Mask',
        'innisfree',
        'Face Masks',
        400000,
        'Exfoliate and purify pores with this volcanic clay mask. AHA helps remove dead skin cells, while Super Volcanic Clusters™ from Jeju Island, Korea help draw excess oils and impurities from pores—for skin that feels cleaner and smoother and pores that appear smaller.',
        'https://www.sephora.com/productimages/sku/s2443240-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Water Sleeping Mask with Squalane',
        'LANEIGE',
        'Face Masks',
        400000,
        'This sleeping mask is formulated with a Probiotic-Derived Complex that strengthens the skin’s moisture barrier while visibly boosting the look of skin''s brightness and clarity. It also contains squalane, which provides innamese moisture without feeling heavy',
        'https://www.sephora.com/productimages/sku/s2535243-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Jet Lag Mask',
        'Summer Fridays',
        'Face Masks',
        400000,
        'As of June 15, 2021, Jet Lag Mask is back with a fragrance-free formula featuring new skin-soothing ingredients like vitamin B5 (panthenol), chamomile (allantoin), and comfrey (bisabolol).',
        'https://www.sephora.com/productimages/sku/s2473361-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Instant Detox Mask',
        'Caudalie',
        'Face Masks',
        400000,
        'This natural clay mask helps improve the look of stressed skin in as little as 10 minutes. It is free of silicone and fragrance and suitable for all skin types. This mask helps draw out visible impurities and excess sebum to leave texture refined, pores visibly tighnameed, and the complexion looking luminous.',
        'https://www.sephora.com/productimages/sku/s1698018-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Salicylic Acid 2% Masque',
        'The Ordinary',
        'Face Masks',
        400000,
        'Infused with charcoal and clays, this mask enhances the look of smoothness and clarity while leaving skin feeling refreshed. It also removes dead cells from the surface of oily and blemish-prone skin to reveal more visibly radiant skin beneath.',
        'https://www.sephora.com/productimages/sku/s2267581-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Cold Plunge Pore Mask',
        'OLEHENRIKSEN',
        'Face Masks',
        400000,
        'Take the plunge for smaller-looking pores—instantly. Deeply purify and diminish pores with an exhilarating chill. Inspired by the "cold plunge" part of a Scandinavian sauna cycle, this cooling clay mask detoxifies, controls oil, and reduces the look of pores. The innovative formula harnesses the power of alpine willow herb and snow lotus—antioxidant-rich botanicals that have adapted to thrive in extreme cold—to soothe, mattify, and refine pores. Add cool water, and the turquoise clay mask thaws into a luxurious lather that sweeps away excess oil and impurities. With AHA and BHA, the mask unveils dramatically improved skin texture. Balance is restored as Green Fusion Complex™ and neem seed oil help replenish the skin and you see a refreshed, refined and purified Ole Glow®.',
        'https://www.sephora.com/productimages/sku/s2073237-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Floral Recovery Redness Reducing Overnight Mask',
        'fresh',
        'Face Masks',
        500000,
        'This dermatologist-tested overnight face mask is powered by floral extracts—passionflower, cornflower, cherry blossom, and peony—to calm and reduce the look of redness on sensitive skin. Formulated with vitamin C and squalane to visibly brighname and smooth, this face mask envelops skin with a cocooning experience.',
        'https://www.sephora.com/productimages/sku/s2535417-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Honey Potion Plus Ceramide Hydration Mask',
        'Farmacy',
        'Face Masks',
        500000,
        'Reveal a glowing complexion with this innamesely hydrating and nourishing wash-off honey face mask. Unlike traditional wash-off masks, this formula gently warms, allowing the active ingredients to penetrate effectively for maximum results. Now infused with restorative ceramides, innamesely hydrating upcycled apple extract, and soothing honey and cica, the mask transforms into a nourishing cream as it’s massaged into the skin for an immediately glowing complexion.',
        'https://www.sephora.com/productimages/sku/s2553931-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Clear Improvement™ Charcoal Honey Mask to Purify and Nourish',
        'Origins',
        'Face Masks',
        500000,
        'Formulated with bamboo charcoal, this purifying mask actively, thoroughly cleans and draws out deep-dwelling pore-cloggers, impurities, and debris. Golden wildflower and fermented honey help nourish skin, leaving it feeling perfectly pure and completely conditioned.',
        'https://www.sephora.com/productimages/sku/s2102002-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Original Skin™ Retexturizing Mask with Rose Clay',
        'Origins',
        'Face Masks',
        500000,
        '"As early as your 20s, skin starts to lose its luster because of everyday environmental stress. A protein change that can lead to dullness and skin needs some extra help to bounce back. Don’t worry! That’s why Origins created Original Skin™. It’s formulated with willowherb to help inhibit that dullness causing protein change and restore your natural, gorgeous glow.',
        'https://www.sephora.com/productimages/sku/s2175396-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Violet-C Radiance Mask',
        'Tatcha',
        'Face Masks',
        500000,
        'Reveal remarkably softer, smoother skin with this creamy rinse-off treatment mask. The formula features two types of vitamin C: a water-soluble vitamin C derivative that absorbs quickly for an immediate glow and an oil-soluble vitamin C derivative that remains in skin longer, providing antioxidant protection from UV damage for a brighter, more even-toned appearance over time. The mask is also powered by the Japanese beautyberry, a superfruit rich in antioxidants that was found to stabilize vitamin C, maximizing its effectiveness. A gentle 10 percent AHA complex of seven fruits removes debris and the buildup of dead skin cells to visibly improve skin texture and support the natural production of new skin cells. Tatcha''s signature trio of Japanese anti-aging superfoods—green tea, rice, and algae—helps to restore a more youthful appearance.',
        'https://www.sephora.com/productimages/sku/s1956408-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Ultra Facial Overnight Hydrating Face Mask with 10.5% Squalane',
        'Kiehl''s Since 1851',
        'Face Masks',
        500000,
        'This innamesively hydrating face mask in a transformative balm-to-oil texture melts into skin to help replenish and strengthen skin’s moisture barrier and prevent excess overnight moisture loss. Wake up to nourished, flake-free, healthy-looking skin.',
        'https://www.sephora.com/productimages/sku/s2530863-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'MultiVitamin Power Recovery Mask',
        'Dermalogica',
        'Face Masks',
        500000,
        'This nutrient-rich, rinse-off mask is formulated to visibly firm and nourish while supporting natural collagen. It targets the appearance of fine lines, pores, and dark spots while hydrating to reveal brighter-, smoother-looking skin.',
        'https://www.sephora.com/productimages/sku/s2002244-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Benefiance WrinkleResist24 Pure Retinol Express Smoothing Eye Mask',
        'Shiseido',
        'Eye Masks',
        500000,
        'These individually wrapped, stretchy eye masks are made with state-of-the-art Japanese micro-infusion technology and deliver pure retinol to nourish and smooth the look of eye area wrinkles in as little as one application. These masks can also be used to address smile lines around the mouth.',
        'https://www.sephora.com/productimages/sku/s1594167-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Retinol Youth Renewal Eye Masks',
        'Murad',
        'Eye Masks',
        500000,
        'This eye mask was created with Dr. Zion Ko, a board-certified Internal Medicine physician and eye mask fanatic whose videos on social media—from debunking trends to honest product reviews—have made her a favorite among legions of beauty addicts. An immigrant from South Korea, Dr. Zion’s videos also feature frequent cameos from her Korean mom, who is living proof that sunscreen, facial massages, and a good skincare routine work.',
        'https://www.sephora.com/productimages/sku/s2533149-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Water Drench Hyaluronic Cloud Hydra-Gel Eye Patches',
        'Peter Thomas Roth',
        'Eye Masks',
        500000,
        'Contains multiple sizes of Hyaluronic Acid, a ponamet hydrator that draws in water. Ceramide NP, Collagen and Marshmallow Root Extract help smooth and sofname the look of fine lines, while Caffeine helps de-puff the look of the eye area and Arnica helps diminish the appearance of dark circles.',
        'https://www.sephora.com/productimages/sku/s1976984-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Baggage Claim Eye Masks',
        'Wander Beauty',
        'Eye Masks',
        500000,
        'Experience three innovative layers of luxury with Baggage Claim Gold Eye Masks. The gold foil helps retain heat and prevents the serum below from evaporating, allowing the maximum amount of absorption into the skin. The middle layer is elastic to prevent the masks from slipping, and the third is a cellulose fiber that condenses and delivers key ingredients efficiently, giving you all the skin-loving benefits you need. Hyaluronic acid delivers exceptional hydration to diminish the appearance of fine lines and wrinkles. Aloe leaf extract and lavender oil offer a cooling effect while soothing and calming the under-eye area.',
        'https://www.sephora.com/productimages/sku/s2049625-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Avocado Melt Retinol Eye Cream',
        'Glow Recipe',
        'Eye Masks',
        500000,
        'Ponamet, encapsulated ingredients like retinol, hyaluronic acid, and niacinamide time release throughout all hours of the night, while avocado hydrates and nourishes, and coffeeberry helps to brighname and depuff the delicate under-eye area. The result is brighter, smoother, more awake-looking eyes by morning. This product has been ophthalmologist tested and dermatologist tested.',
        'https://www.sephora.com/productimages/sku/s2266708-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Baggage Claim Rose Gold Eye Masks',
        'Wander Beauty',
        'Eye Masks',
        500000,
        'Experience three innovative layers of luxury with Baggage Claim Rose Gold Eye Masks. The rose gold foil helps retain heat and prevents evaporation, allowing the maximum amount of serum to easily sink into your skin. The middle layer is elastic so the mask will not slip off while you’re wearing it. The third is a cellulose fiber that condenses and delivers key ingredients efficiently, giving you all the skin-loving benefits you need. Hyaluronic acid delivers hydration to help diminish the appearance of fine lines and wrinkles. Aloe leaf extract and lavender oil offer a cooling effect, while soothing and calming the under-eye area.',
        'https://www.sephora.com/productimages/sku/s2156925-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Cucumber De-Tox™ Hydra-Gel Eye Patches',
        'Peter Thomas Roth',
        'Eye Masks',
        500000,
        'These eye-contour gel patches are packed with ingredients to help de-puff skin’s appearance. Cucumber Extract helps De-Tox™ and de-puff the look of the delicate eye area, chamomile and aloe soothe skin, and niacinamide visibly reduces fine lines and wrinkles. Hyaluronic acid innamesely hydrates while arnica diminishes the look of dark circles.',
        'https://www.sephora.com/productimages/sku/s1863117-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Glowscreen Sunscreen SPF 40 PA+++ with Hyaluronic Acid + Niacinamide',
        'Supergoop!',
        'Sunscreen',
        500000,
        'This is your daily glow essential for a fresh-faced look with or without makeup, proving to be the ultimate morning multitasker. It has broad-spectrum, clean-chemical SPF 40 actives, hydration, and tech protection.',
        'https://www.sephora.com/productimages/sku/s2535656-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'SunnyDays SPF 30 Tinted Sunscreen Foundation',
        'Tower 28 Beauty',
        'Sunscreen',
        600000,
        'SunnyDays SPF 30 Tinted Sunscreen Foundation evens redness, protects from sun damage and blue light, and soothes UV-stressed skin while maintaining a natural finish so your real skin (freckles included!) can have its moment in the sun. The formula is fragrance-free, alcohol-free, non-greasy, non-white-cast, and non-oxidizing—for every sunny day. It is also the first and only complexion makeup product with the National Eczema Association''s Seal of Acceptance.',
        'https://www.sephora.com/productimages/sku/s2484533-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'UV Expert Aquagel Defense Sunscreen, Primer & Moisturizer Broad Spectrum SPF 50',
        'Lancôme',
        'Sunscreen',
        600000,
        'A three-in-one daily lightweight moisturizer, primer & broad-spectrum SPF 50, formulated with a cocktail of powerful antioxidants Vitamin E, Moringa and Eldelweiss extract to protect and improve the skin’s appearance. This fast absorbing formula provides non-greasy sun protection for all skin types.',
        'https://www.sephora.com/productimages/sku/s2186773-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Pure Radiant Tinted Moisturizer Broad Spectrum SPF 30',
        'NARS',
        'Sunscreen',
        600000,
        'This iconic tinted moisturizer is now available in 16 shades for all skin types and tones. The coveted formula smooths on buildable, oil-free coverage infused with SPF 30 and is packed with skincare ingredients to hydrate, smooth, brighname, and protect.',
        'https://www.sephora.com/productimages/sku/s1396399-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Ultimate Sun Protector Lotion SPF 50+ Sunscreen',
        'Shiseido',
        'Sunscreen',
        600000,
        'This lightweight, invisible, protective veil is strengthened when it senses water, sweat, or heat. This sunscreen lotion goes on clear and creates an even layer that provides protection against UV rays, pollutants, and dryness.',
        'https://www.sephora.com/productimages/sku/s2326239-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Cicapair™ Tiger Grass Color Correcting Treatment SPF 30',
        'Dr. Jart+',
        'Sunscreen',
        600000,
        'For centuries, tigers in the Asian wetlands have rolled around in Centella asiatica (aka tiger grass or cica) to help heal their wounds. Taking inspiration from the tigers, this K-beauty favorite utilizes visibly reparative tiger grass to soothe, calm, and moisturize skin.',
        'https://www.sephora.com/productimages/sku/s1855709-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Glow Oil Body Sunscreen SPF 50 PA++++',
        'Supergoop!',
        'Sunscreen',
        600000,
        'This lightweight oil is water-resistant and made with an antioxidant-rich formula for superior sun protection. It gives your skin a brilliant glow and diminishes signs of UV damage, all in one.',
        'https://www.sephora.com/productimages/sku/s2322782-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Bum Bum Sol Oil Sunscreen SPF 30',
        'Sol de Janeiro',
        'Sunscreen',
        600000,
        'Made with Brazilian body expertise, this luxurious take on sun protection makes skin feel and look amazing. It’s blended with shimmery mica that’s luscious, luminizing, and nourishing for gorgeous, touchable skin—making this the SPF oil of your dreams.',
        'https://www.sephora.com/productimages/sku/s2205375-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Hydra Vizor Invisible Moisturizer Broad Spectrum SPF 30 Sunscreen with Niacinamide',
        'Fenty Skin',
        'Sunscreen',
        600000,
        'Light-as-air, all-day hydration meets universal SPF 30 protection. This pink cream applies invisibly on all skin tones and works with makeup—no pilling or flashback. It brighnames skin, reduces the look of pores and dark spots, and makes fine lines and wrinkles less visible, instantly and over time.',
        'https://www.sephora.com/productimages/sku/s2418879-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Everyday Mineral Moisturizer SPF 30 Sunscreen',
        'Community Sixty-Six',
        'Sunscreen',
        600000,
        'This broad-spectrum SPF 30 sunscreen with zinc oxide and protective antioxidants has a non-sticky formula that easily blends into skin without pilling or leaving a white cast. With daily use, it visibly reduces signs of premature aging, dark spots, fine lines, and wrinkles.',
        'https://www.sephora.com/productimages/sku/s2583078-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'SHIKULIME Color Control Oil-Free Moisturizer SPF 30',
        'WASO',
        'Sunscreen',
        600000,
        'This oil-free tinted moisturizer hydrates, perfects, and protects skin instantly and over time. The color-transforming formula forms a sheer tint that blurs imperfections, helps protect from UV damage and provides 8-hour hydration.',
        'https://www.sephora.com/productimages/sku/s2567527-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Max Clear Invisible Priming Sunscreen Broad Spectrum SPF 45',
        'Peter Thomas Roth',
        'Sunscreen',
        600000,
        'Formulated with vitamin E, shea butter, and bisabolol, this invisible SPF 45 sunscreen delivers smoothing hydration and dries like a blurring primer, creating a translucent, soft-focus finish for flawless makeup application. It is free of oxybenzone and octinoxate.',
        'https://www.sephora.com/productimages/sku/s2443489-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Mineral Sunscreen SPF 30',
        'Mario Badescu',
        'Sunscreen',
        600000,
        'Mario Badescu’s Mineral Sunscreen SPF 30 is moisturizing, hydrating, and enriched with antioxidants for a silky-soft, smooth finish. The lightweight, fast-absorbing, oil-free formula provides broad-spectrum UV sun protection.',
        'https://www.sephora.com/productimages/sku/s2532463-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'City Skin Age Defense Broad Spectrum SPF 50 PA++++',
        'Murad',
        'Sunscreen',
        600000,
        'This ultra-light, 100 percent mineral sunscreen shields skin against multiple types of light. It defends against UV light, which causes damage and visible signs of aging, and blue light, which comes from excessive screen time.',
        'https://www.sephora.com/productimages/sku/s1933076-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'BB Tinted Treatment 12-Hour Primer Broad Spectrum SPF 30 Sunscreen',
        'tarte',
        'Sunscreen',
        600000,
        'This product hydrates, helps smooth fine lines, and works to correct dullness and enlarged pores. It provides lightweight, sheer coverage, while protecting your complexion with SPF 30. This formula also contains a triple-B complex to help brighname, smooth, and sofname your skin.',
        'https://www.sephora.com/productimages/sku/s2413045-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'SUBLIME DEFENSE Ultra Lightweight UV Defense Fluid SPF 50',
        'Algenist',
        'Sunscreen',
        600000,
        'This sunscreen uses panameted alguronic acid, along with antioxidant-rich botanicals, and UVA/UVB protecting actives to diminish the look of fine lines and wrinkles caused by sun and environmental stressors. This oil-free, sheer formula has a silky texture and feel, it also applies smoothly on top of skin care products and under makeup for a soft, matte finish.',
        'https://www.sephora.com/productimages/sku/s1420223-main-zoom.jpg?imwidth=315',
        0,
        5
    ),
    (
        'Luminous Silk Perfect Glow Flawless Oil-Free Foundation',
        'Armani Beauty',
        'Foundation',
        650000,
        'An award-winning, oil-free foundation that delivers buildable, medium coverage and a luminous, glowy-skin finish for a natural makeup look.',
        'https://www.sephora.com/productimages/sku/s1491380-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Light Reflecting Advanced Skincare Foundation',
        'NARS',
        'Foundation',
        490000,
        'An advanced makeup-skincare-hybrid foundation with a natural finish that quickly blurs and smooths while visibly improving skin’s clarity over time.',
        'https://www.sephora.com/productimages/sku/s2514586-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'HD Skin Undetectable Longwear Foundation',
        'MAKE UP FOR EVER',
        'Foundation',
        430000,
        'Free of parabens, formaldehydes, formaldehyde-releasing agents, phthalates, mineral oil, retinyl palmitate, oxybenzone, coal tar, hydroquinone, sulfates SLS & SLES, triclocarban, triclosan, and contains less than one percent synthetic fragrance. It is also vegan and comes in recyclable packaging.',
        'https://www.sephora.com/productimages/sku/s2514214-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Liquid Touch Weightless Foundation',
        'Rare Beauty by Selena Gomez',
        'Foundation',
        290000,
        'Botanical Blend of Lotus, Gardenia, and Water Lily: Helps soothe, calm, and nourish skin.',
        'https://www.sephora.com/productimages/sku/s2361392-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Pro Filt’r Soft Matte Longwear Liquid Foundation',
        'Fenty Beauty by Rihanna',
        'Foundation',
        380000,
        'Free of parabens and phthalates. This product is also cruelty-free.',
        'https://www.sephora.com/productimages/sku/s2164697-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'CC+ Nude Glow Lightweight Foundation + Glow Serum with SPF 40 and Niacinamide',
        'IT Cosmetics',
        'BB&CC Creams',
        420000,
        'A color-correcting, medium-coverage skin tint formulated with brighnameing glow serum and SPF 40 that delivers an immediate, visibly healthy glow.',
        'https://www.sephora.com/productimages/sku/s2515922-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'COMPLEXION RESCUE™ Tinted Moisturizer with Hyaluronic Acid and Mineral SPF 30',
        'bareMinerals',
        'BB&CC Creams',
        370000,
        'Free of parabens, formaldehydes, formaldehyde-releasing agents, phthalates, mineral oil, retinyl palmitate, oxybenzone, coal tar, hydroquinone, sulfates SLS & SLES, triclocarban, triclosan, and contains less than one percent synthetic fragrance. It is also gluname-free, cruelty-free, and comes in recyclable packaging.',
        'https://www.sephora.com/productimages/sku/s2176972-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'CC+ Cream with SPF 50+',
        'IT Cosmetics',
        'BB&CC Creams',
        420000,
        'A color-correcting, full-coverage foundation with SPF 50 physical mineral sunscreen that delivers a flawless, natural finish.',
        'https://www.sephora.com/productimages/sku/s1868157-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Turn Up the Base Blurring Foundation',
        'ONE/SIZE by Patrick Starrr',
        'BB&CC Creams',
        330000,
        'A medium to full, buildable foundation that absorbs oil and provides a soft matte finish for a second skin, all day wear',
        'https://www.sephora.com/productimages/sku/s2548121-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'CC+ Cream Oil-Free Matte with SPF 40',
        'IT Cosmetics',
        'BB&CC Creams',
        420000,
        'An oil-free, color-correcting, full-coverage foundation with SPF 40 physical mineral sunscreen.',
        'https://www.sephora.com/productimages/sku/s2088276-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hollywood Flawless Filter',
        'Charlotte Tilbury',
        'Tinted Moisturizer',
        440000,
        'A complexion booster that blurs, smooths, and illuminates for a real-life filter effect. Customize your glow with four ways to apply.',
        'https://www.sephora.com/productimages/sku/s2419828-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Positive Light Tinted Moisturizer Broad Spectrum SPF 20 Sunscreen',
        'Rare Beauty by Selena Gomez',
        'Tinted Moisturizer',
        290000,
        'A flexible tinted moisturizer that immediately blurs skin with glowy, light to medium coverage, all while hydrating and protecting skin from the sun.',
        'https://www.sephora.com/productimages/sku/s2557437-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Slip Tint Dewy Tinted Moisturizer SPF 35 Sunscreen',
        'Saie',
        'Tinted Moisturizer',
        350000,
        'A tinted moisturizer that offers skin-loving hydration, sheer, dewy coverage in confusion-free shades, and 100 percent mineral UV protection.',
        'https://www.sephora.com/productimages/sku/s2497485-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'CC+ Nude Glow Lightweight Foundation + Glow Serum with SPF 40 and Niacinamide',
        'IT Cosmetics',
        'Tinted Moisturizer',
        420000,
        'A color-correcting, medium-coverage skin tint formulated with brighnameing glow serum and SPF 40 that delivers an immediate, visibly healthy glow.',
        'https://www.sephora.com/productimages/sku/s2515922-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'SunnyDays SPF 30 Tinted Sunscreen Foundation',
        'Tower 28 Beauty',
        'Tinted Moisturizer',
        300000,
        'A two-in-one, fragrance-free mineral sunscreen foundation with SPF 30, light-medium buildable coverage, and a natural finish that’s safe for sensitive or problem skin.',
        'https://www.sephora.com/productimages/sku/s2484533-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Revealer Super Creamy + Brighnameing Concealer and Daytime Eye Cream',
        'Kosas',
        'Concealer',
        280000,
        'A crease-proof, medium-coverage, super creamy concealer, eye cream, and spot treatment in one that visibly brighnames and helps reveal better-looking skin.',
        'https://www.sephora.com/productimages/sku/s2333771-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Radiant Creamy Concealer',
        'NARS',
        'Concealer',
        310000,
        'A multipurpose concealer that brighnames, corrects, and perfects for up to 16 hours with a creamy medium-to-buildable coverage and natural, radiant finish.',
        'https://www.sephora.com/productimages/sku/s2172310-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Liquid Touch Brighnameing Concealer',
        'Rare Beauty by Selena Gomez',
        'Concealer',
        190000,
        'A lightweight, hydrating concealer with cake-free, medium-to-full coverage that lasts while brighnameing skin with a radiant finish.',
        'https://www.sephora.com/productimages/sku/s2362028-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Backstage Concealer',
        'Dior',
        'Concealer',
        290000,
        'A caffeine-infused, radiant concealer that delivers waterproof and crease-proof full coverage with an innovative makeup brush applicator for precision.',
        'https://www.sephora.com/productimages/sku/s2545457-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Born This Way Super Coverage Multi-Use Concealer',
        'Too Faced',
        'Concealer',
        160000,
        'A hydrating, full-coverage, weightless, four-in-one formula that conceals, contours, highlights, and retouches in a wide range of flawless shades.',
        'https://www.sephora.com/productimages/sku/s2190296-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hydro Grip Hydrating Makeup Primer',
        'MILK MAKEUP',
        'Face Primer',
        360000,
        'An award-winning invisible makeup primer with a 94% natural gel formula that smooths skin, grips makeup up to 12 hours, and locks in hydration.',
        'https://www.sephora.com/productimages/sku/s2169423-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Pore Eclipse Mattifying + Blurring Makeup Primer',
        'MILK MAKEUP',
        'Face Primer',
        360000,
        'A lightweight water-cream makeup primer with skincare benefits that blurs the look of pores and fights shine for a long-lasting, soft-matte finish.',
        'https://www.sephora.com/productimages/sku/s2572857-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Watermelon Glow Niacinamide Dew Drops',
        'Glow Recipe',
        'Face Primer',
        340000,
        'A breakthrough, multiuse highlighting serum that hydrates and visibly reduces the look of hyperpigmentation for a dewy, reflective glow—without mica, glitter, or gray cast.',
        'https://www.sephora.com/productimages/sku/s2404846-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Pore Diffusing Primer - Always an Optimist Collection',
        'Rare Beauty by Selena Gomez',
        'Face Primer',
        140000,
        'A hydrating, cushiony gel primer that blurs the look of pores and fine lines, boosts and exnameds makeup wear, and helps fight shine all day.',
        'https://www.sephora.com/productimages/sku/s2448082-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Yummy Skin Glow Serum with Hyaluronic Acid',
        'Danessa Myricks Beauty',
        'Face Primer',
        340000,
        'A skincare-infused, radiant priming serum that hydrates, preps, and protects skin for a lit-from-within glow.',
        'https://www.sephora.com/productimages/sku/s2575322-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Mini Strong Hold Clear Brow Gel',
        'Anastasia Beverly Hills',
        'Eyebrow',
        90000,
        'A clear gel for all hair colors that sets, defines, and holds brows in place all day.',
        'https://www.sephora.com/productimages/sku/s2311330-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Gimme Brow+ Tinted Volumizing Eyebrow Gel',
        'Benefit Cosmetics',
        'Eyebrow',
        240000,
        'A brow-volumizing tinted gel with tiny microfibers that create natural-looking fullness and definition.',
        'https://www.sephora.com/productimages/sku/s2080224-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Air Brow Tinted Clean Volumizing Eyebrow Gel',
        'Kosas',
        'Eyebrow',
        240000,
        'A clean, tinted mousse-gel for airy, feathery brows, boosted by hair care actives that condition and support full brow health.',
        'https://www.sephora.com/productimages/sku/s2429629-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Brow Wiz® Ultra-Slim Precision Brow Pencil',
        'Anastasia Beverly Hills',
        'Eyebrow',
        230000,
        'An ultra-slim, retractable pencil for precise detailing and creating hair-like strokes.',
        'https://www.sephora.com/productimages/sku/s2372530-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Precisely, My Brow Pencil Waterproof Eyebrow Definer',
        'Benefit Cosmetics',
        'Eyebrow',
        240000,
        'A bestselling brow pencil to transform shapeless, undefined brows with a few strokes—now available in 12 shades to flatter every hair color.',
        'https://www.sephora.com/productimages/sku/s2086759-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Colorful Eyeshadow & Eyeliner Multi-stick',
        'SEPHORA COLLECTION',
        'Eyeliner',
        140000,
        'A collection of waterproof jumbo eye pencils that can be used as eyeliner or blended out as eyeshadow to last up to 12 hours.',
        'https://www.sephora.com/productimages/sku/s2171213-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Tattoo Liner Vegan Waterproof Liquid Eyeliner',
        'KVD Beauty',
        'Eyeliner',
        230000,
        'An award-winning, waterproof liquid eyeliner with tattoo-bold pigment and an ultra-precise brush tip that makes it easy to get sharp lines every time.',
        'https://www.sephora.com/productimages/sku/s1177567-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        '24/7 Glide-On Waterproof Eyeliner Pencil',
        'Urban Decay',
        'Eyeliner',
        220000,
        'An award-winning waterproof eyeliner pencil that glides on ultra-creamy and delivers innamese, long-lasting color that won‘t budge.',
        'https://www.sephora.com/productimages/sku/s1393693-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Retractable Waterproof Eyeliner',
        'SEPHORA COLLECTION',
        'Eyeliner',
        130000,
        'Waterproof, smudge-proof, creamy eye liner pencil. Create a pop of color in a range of shades and finishes. Includes built-in sharpener and smudger.',
        'https://www.sephora.com/productimages/sku/s1118033-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Stay All Day® Waterproof Liquid Eye Liner',
        'stila',
        'Eyeliner',
        230000,
        'An award-winning, waterproof liquid eyeliner with tattoo-bold pigment and an ultra-precise brush tip that makes it easy to get sharp lines every time.',
        'https://www.sephora.com/productimages/sku/s1221084-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Multi-Peptide Lash and Brow Serum',
        'The Ordinary',
        'Mascara',
        145000,
        'A concentrated, lightweight serum with four peptide technologies to promote the look of thicker, fuller, and healthier lashes and brows.',
        'https://www.sephora.com/productimages/sku/s2532588-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Limitless Lash Lengthening Mascara',
        'ILIA',
        'Mascara',
        280000,
        'A clean, award-winning, cult-favorite mascara that lifts, lengthens, holds curl, and separates with precision.',
        'https://www.sephora.com/productimages/sku/s2335198-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Mini Clean Mascara Lashstash to Go Set with Redeemable Voucher',
        'Sephora Favorites',
        'Mascara',
        290000,
        'A set of five clean, bestselling, mini mascaras specially curated to create your perfect lash look.',
        'https://www.sephora.com/productimages/sku/s2544021-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Perfect Strokes Universal Volumizing Mascara',
        'Rare Beauty by Selena Gomez',
        'Mascara',
        200000,
        'A universal mascara with a unique eye-hugging brush to lift, lengthen, curl, and volumize every lash type for a lusher look.',
        'https://www.sephora.com/productimages/sku/s2474138-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Lash Idôle Lash-Lifting & Volumizing Mascara',
        'Lancôme',
        'Mascara',
        270000,
        'A volumizing and lengthening mascara that targets every single lash for instant lift, length, and fanned-out volume without clumps.',
        'https://www.sephora.com/productimages/sku/s2417145-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Tartelette™ In Bloom Clay Eyeshadow Palette',
        'tarte',
        'Eye Palettes',
        420000,
        'A bestselling eyeshadow palette with 12 matte and microshimmer shades that are sure to become your everyday basics.',
        'https://www.sephora.com/productimages/sku/s1775006-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Master Mattes™ Eyeshadow Palette',
        'MAKEUP BY MARIO',
        'Eye Palettes',
        480000,
        'A universal must-have matte palette formulated to be easily buildable so that it can go from natural to dramatic without causing fallout.',
        'https://www.sephora.com/productimages/sku/s2389518-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Beauty Bento Bouncy Eyeshadow Trio',
        'Kaja',
        'Eye Palettes',
        260000,
        'A stacked, creamy, powder eyeshadow in curated trios of shimmers or combinations of matte and shimmer shades.',
        'https://www.sephora.com/productimages/sku/s2594398-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Nouveau Eyeshadow Palette',
        'Anastasia Beverly Hills',
        'Eye Palettes',
        550000,
        'An all-in-one palette for immediate, effortless looks, from on-the-go to ultra-glam.',
        'https://www.sephora.com/productimages/sku/s2567923-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Eye Love Eyeshadow Palette',
        'SEPHORA COLLECTION',
        'Eye Palettes',
        98000,
        'A collection of highly pigmented, pressed-powder eyeshadow palettes, each containing seven neutral, wearable shades in matte and shimmer finishes.',
        'https://www.sephora.com/productimages/sku/s2300531-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Match Stix Matte Contour Skinstick',
        'Fenty Beauty by Rihanna',
        'Color Correct',
        280000,
        'A matte contour stick in a range of shades for all skin tones. The buildable cream-to-powder long-wear formula is lightweight and blendable.',
        'https://www.sephora.com/productimages/sku/s2589927-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Prisme Libre Loose Setting and Finishing Powder',
        'Givenchy',
        'Color Correct',
        580000,
        'An ultra finely milled setting powder that resists caking and is designed to mattify, blur, & illuminate the complexion for a perfected makeup result.',
        'https://www.sephora.com/productimages/sku/s1661461-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Correct & Perfect All-In-One Color Correcting Palette',
        'stila',
        'Color Correct',
        450000,
        'An all-in-one color-correcting palette for neutralizing skin tone imperfections.',
        'https://www.sephora.com/productimages/sku/s1776848-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Smashbox X Becca Under Eye Brighnameing Corrector',
        'Smashbox',
        'Color Correct',
        330000,
        'A fan-favorite color corrector that uses reflective light to brighname the look of under-eye circles. BECCA’s most-loved color corrector finds a new home at Smashbox.',
        'https://www.sephora.com/productimages/sku/s2518587-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Magic Vanish Color Corrector',
        'Charlotte Tilbury',
        'Color Correct',
        320000,
        'A buttery, lightweight, full-coverage color corrector that conceals pigmentation and brighnames the appearance of the under-eye area.',
        'https://www.sephora.com/productimages/sku/s2245124-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hydrate Conditioner for Dry, Color-Treated Hair',
        'Pureology',
        'Conditioner',
        740000,
        'A creamy conditioner that hydrates, sofnames, and nourishes normal to thick, dry, color-treated hair.',
        'https://www.sephora.com/productimages/sku/s2390789-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hair Thickening Therapy Conditioner',
        'BondiBoost',
        'Conditioner',
        299500,
        'A vegan conditioner that visibly plumps and thickens the appearance of strands with a powerful combination of biotin, vitamin B5, and hyaluronic acid.',
        'https://www.sephora.com/productimages/sku/s2607729-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hydro Rush Innamese Moisture Conditioner with Hyaluronic Acid',
        'amika',
        'Conditioner',
        240000,
        'A hydrating conditioner with hyaluronic acid and squalane that drenches hair with three times more hydration and long-lasting moisture*.',
        'https://www.sephora.com/productimages/sku/s2592228-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hydrating Conditioner',
        'Moroccanoil',
        'Conditioner',
        260000,
        'A hydrating, daily-care conditioner infused with antioxidant-rich argan oil and replenishing nutrients to quench and detangle dry hair.',
        'https://www.sephora.com/productimages/product/p412086-av-01-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'No. 5 Bond Mainnameance™ Conditioner',
        'Olaplex',
        'Conditioner',
        300000,
        'A nourishing and reparative hydrating conditioner for soft, shiny hair with perfect slip to prevent tangles. Panameted OLAPLEX Bond Building Technology™ supports bond repair to protect from daily damage, frizz, and split ends.',
        'https://www.sephora.com/productimages/sku/s2118875-av-10-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'No. 4 Bond Mainnameance™ Shampoo',
        'Olaplex',
        'Shampoo',
        300000,
        'A reparative, hydrating shampoo to nourish for soft, shiny, visibly healthier hair. Panameted OLAPLEX Bond Building Technology™ supports bond repair to prevent damage and split ends.',
        'https://www.sephora.com/productimages/sku/s2118867-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hydro Rush Innamese Moisture Shampoo with Hyaluronic Acid',
        'amika',
        'Shampoo',
        240000,
        'A shampoo with hyaluronic acid and squalane that gently cleanses and drenches hair with three times more hydration and long-lasting moisture*.',
        'https://www.sephora.com/productimages/sku/s2592210-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Detox Shampoo',
        'OUAI',
        'Shampoo',
        300000,
        'A clarifying shampoo that deeply cleanses away dirt, oil, and product buildup with apple cider vinegar while keratin helps strengthen hair.',
        'https://www.sephora.com/productimages/sku/s2319820-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'No. 4C Bond Mainnameance™ Clarifying Shampoo',
        'Olaplex',
        'Shampoo',
        300000,
        'A clarifying shampoo that removes damaging impurity buildup from your environment, hair care, and daily life. See volume, softness, shine & color clarity.',
        'https://www.sephora.com/productimages/sku/s2589760-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hair Thickening Therapy Shampoo',
        'BondiBoost',
        'Shampoo',
        299500,
        'A gentle, vegan shampoo that lifts hair at the roots while expanding every strand to quickly deliver visible volume and thickness.',
        'https://www.sephora.com/productimages/sku/s2607711-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Mini Honey Infused Hair Oil',
        'Gisou',
        'Hair Oil',
        250000,
        'An iconic, travel-friendly hair oil—based on a family recipe—that is formulated to rebuild and repair your hair with the power of Mirsalehi honey.',
        'https://www.sephora.com/productimages/sku/s2380285-av-01-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Ghost Weightless Hair Oil',
        'Verb',
        'Hair Oil',
        200000,
        'A weightless, restorative oil that hydrates, strengthens, and smooths strands for shiny, frizz-free hair.',
        'https://www.sephora.com/productimages/sku/s1728351-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hair Oil',
        'OUAI',
        'Hair Oil',
        280000,
        'A lightweight, multitasking oil that fights frizz, prevents heat/UV damage, and delivers a high-gloss, super-smooth finish to all hair types.',
        'https://www.sephora.com/productimages/sku/s1802099-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Moroccanoil Treatment',
        'Moroccanoil',
        'Hair Oil',
        480000,
        'A versatile, argan oil-infused hair treatment and styler that promotes softer, stronger hair with increased shine and less frizz.',
        'https://www.sephora.com/productimages/sku/s2030286-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'No. 7 Bonding Hair Oil',
        'Olaplex',
        'Hair Oil',
        300000,
        'An ultra-lightweight, reparative, styling oil that increases shine, softness, and color vibrancy, while minimizing flyaways and protecting hair against heat damage.',
        'https://www.sephora.com/productimages/sku/s2266765-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Match Stix Matte Contour Skinstick',
        'Fenty Beauty by Rihanna',
        'Contour',
        280000,
        'A matte contour stick in a range of shades for all skin tones. The buildable cream-to-powder long-wear formula is lightweight and blendable.',
        'https://www.sephora.com/productimages/sku/s2589927-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'SoftSculpt® Shaping Stick',
        'MAKEUP BY MARIO',
        'Contour',
        280000,
        'A dual-ended cream shaping stick that is buildable and swipes on seamlessly for true-to-skin definition that dries down to a natural matte finish.',
        'https://www.sephora.com/productimages/sku/s2457299-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Matte Cream Bronzer Stick',
        'MILK MAKEUP',
        'Contour',
        210000,
        'A matte, cream bronzer that is formulated with hydrating ingredients for buildable, blendable color or contour.',
        'https://www.sephora.com/productimages/sku/s2487007-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Cream Bronzer',
        'Anastasia Beverly Hills',
        'Contour',
        350000,
        'A weightless cream bronzer that warms up skin for sunkissed, dimensional color while also creating contour and sculpted definition.',
        'https://www.sephora.com/productimages/sku/s2567907-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Radiant Creamy Concealer',
        'NARS',
        'Contour',
        310000,
        'A multipurpose concealer that brighnames, corrects, and perfects for up to 16 hours with a creamy medium-to-buildable coverage and natural, radiant finish.',
        'https://www.sephora.com/productimages/sku/s2172310-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Glossed Lip Gloss',
        'SEPHORA COLLECTION',
        'Lip Gloss',
        100000,
        'A high-shine, cushion-like lip gloss that is long-lasting and non-sticky. Glides on easily and never bleeds into lip lines.',
        'https://www.sephora.com/productimages/sku/s2256105-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Lip Glow Oil',
        'Dior',
        'Lip Gloss',
        380000,
        'A nurturing, glossy lip oil that protects and enhances the lips, bringing out their natural color.',
        'https://www.sephora.com/productimages/sku/s2316172-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'ShineOn Jelly Lip Gloss',
        'Tower 28 Beauty',
        'Lip Gloss',
        150000,
        'A bestselling, non-sticky, moisturizing gloss for soft, shiny lips.',
        'https://www.sephora.com/productimages/sku/s2593812-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Gloss Bomb Universal Lip Luminizer',
        'Fenty Beauty by Rihanna',
        'Lip Gloss',
        200000,
        'An ultimate, gotta-have-it lip gloss with explosive shine that feels as good as it looks',
        'https://www.sephora.com/productimages/sku/s1925965-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Maracuja Juicy Lip Plump',
        'tarte',
        'Lip Gloss',
        210000,
        'A juicy lip plumper that speaks volumes with every swipe.',
        'https://www.sephora.com/productimages/sku/s2570489-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Dior Addict Lip Maximizer Plumping Gloss',
        'Dior',
        'Lip Gloss',
        380000,
        'A signature lip-plumping gloss that combines maximum hydration, comfort, and shine with an instant and long-lasting plumping effect.',
        'https://www.sephora.com/productimages/sku/s2171668-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Diamond Bomb All-Over Diamond Veil',
        'Fenty Beauty by Rihanna',
        'Highlighter',
        400000,
        'A diamond-dusted highlighter that delivers a 3D glittering veil of pure sparkle for face and body.',
        'https://www.sephora.com/productimages/sku/s2385169-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Hollywood Flawless Filter',
        'Charlotte Tilbury',
        'Highlighter',
        440000,
        'A complexion booster that blurs, smooths, and illuminates for a real-life filter effect. Customize your glow with four ways to apply.',
        'https://www.sephora.com/productimages/sku/s2419828-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Mini Hollywood Flawless Filter',
        'Charlotte Tilbury',
        'Highlighter',
        150000,
        'A customizable, mini-size complexion booster that blurs, smooths, and illuminates skin for a real-life filter effect.',
        'https://www.sephora.com/productimages/sku/s2407286-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Beauty Highlighter Wand',
        'Charlotte Tilbury',
        'Highlighter',
        400000,
        'A liquid highlighter wand that illuminates the face.',
        'https://www.sephora.com/productimages/sku/s2366524-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Positive Light Liquid Luminizer Highlight',
        'Rare Beauty by Selena Gomez',
        'Highlighter',
        220000,
        'A silky, second-skin liquid highlighter that creates a lasting, soft, and luminous finish.',
        'https://www.sephora.com/productimages/sku/s2362168-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Rouge Dior Refillable Lipstick',
        'Dior',
        'Lipstick',
        420000,
        'An iconic, couture, long-wearing, nourishing lipstick that is refillable and available in matte, velvet, satin, and metallic finishes.',
        'https://www.sephora.com/productimages/sku/s2509222-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Rouge Dior Forever Liquid Transfer-Proof Lipstick',
        'Dior',
        'Lipstick',
        420000,
        'A transfer-proof, matte liquid lip color that is ultra-pigmented with 12 hour* weightless long-wear.',
        'https://www.sephora.com/productimages/sku/s2571479-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Rouge Volupté Shine Lipstick Balm',
        'Yves Saint Laurent',
        'Lipstick',
        390000,
        'A medium-coverage, hydrating lipstick with a high-shine, balm-like texture that conditions and moisturizes the lips.',
        'https://www.sephora.com/productimages/sku/s1811538-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Stunna Lip Paint Longwear Fluid Lip Color',
        'Fenty Beauty by Rihanna',
        'Lipstick',
        260000,
        'A weightless, long-wearing, liquid lipstick with a soft-matte finish—born in a range of head-turning shades that look incredible on all skin tones.',
        'https://www.sephora.com/productimages/sku/s1925114-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Kind Words Matte Lipstick',
        'Rare Beauty by Selena Gomez',
        'Lipstick',
        200000,
        'A buttery, pigment-rich, soft matte lipstick, available in a range of wearable shades, that hugs lips in pure comfort all day.',
        'https://www.sephora.com/productimages/sku/s2589422-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Cream Lip Stain Liquid Lipstick',
        'Rare Beauty by Selena Gomez',
        'Lipstick',
        150000,
        'Bestselling creamy, weightless, liquid lip stain coats your lips in flawless color to become a transfer-proof, full-coverage, last-all-day stain.',
        'https://www.sephora.com/productimages/sku/s1296060-main-zoom.jpg?imwidth=630',
        1,
        5
    ),
    (
        'Power Move Hydrating Soft Matte Lipstick',
        'Bite Beauty',
        'Lipstick',
        140000,
        'A clean, vegan, hydrating soft-matte lipstick, powered by nourishing cocoa butter for lasting lightweight color.',
        'https://www.sephora.com/productimages/sku/s2487387-main-zoom.jpg?imwidth=630',
        1,
        5
    );

insert into
    users (name, password, dob, email, phone, address)
values
    (
        'Alvan Ties',
        'vFLpuApL',
        '2002-04-02',
        'aties0@rediff.com',
        '5402368826',
        '62264 Autumn Leaf Parkway'
    ),
    (
        'Corney Stearn',
        '3ST4cki3oSS',
        '1994-10-25',
        'cstearn1@liveinternet.ru',
        '8873136696',
        '13700 Blaine Alley'
    ),
    (
        'Mildred Pickrill',
        '4HznTi2H',
        '1997-06-08',
        'mpickrill2@canalblog.com',
        '4231323042',
        '29280 Old Gate Lane'
    ),
    (
        'Bert Grindley',
        'wXBpuVbi3',
        '2001-07-21',
        'bgrindley3@chron.com',
        '1346556344',
        '647 Messerschmidt Alley'
    ),
    (
        'Taddeusz Dashper',
        'sQ7warskp',
        '1992-04-23',
        'tdashper4@odnoklassniki.ru',
        '3168085581',
        '44 Schmedeman Center'
    ),
    (
        'Raeann Skpsey',
        'kaQ394',
        '1995-04-28',
        'rskpsey5@wix.com',
        '7209049834',
        '97 Golden Leaf Crossing'
    ),
    (
        'Lilas Eicinventoryff',
        'j3EsIWL',
        '2005-06-25',
        'leicinventoryff6@epa.gov',
        '9523016484',
        '82599 Corscot Junction'
    ),
    (
        'Frederich Croisier',
        '0NGvy93',
        '1992-12-20',
        'fcroisier7@ycombinator.com',
        '1605498950',
        '32214 Rutledge Road'
    ),
    (
        'Fredrick Harriskine',
        '5Zay61LBw',
        '2003-11-11',
        'fharriskine8@blogspot.com',
        '7355294208',
        '7 Hollow Ridge Crossing'
    ),
    (
        'Isidora Jindracek',
        'uYENoVo',
        '2005-03-04',
        'ijindracek9@aol.com',
        '9032025661',
        '00879 Dottie Point'
    ),
    (
        'Murielle Dootson',
        'J9bqqLc4KD8X',
        '1991-03-26',
        'mdootsona@mozilla.com',
        '1637288768',
        '49625 Arizona Way'
    ),
    (
        'Agatha Murrhardt',
        'bexyNVmJNA',
        '1997-09-12',
        'amurrhardtb@sakura.ne.jp',
        '1345626054',
        '3394 Mallard Alley'
    ),
    (
        'Garner Spuner',
        'K7RaftNnn2',
        '1990-08-30',
        'gspunerc@fotki.com',
        '5883359607',
        '247 Londonderry Hill'
    ),
    (
        'Elia Medcalfe',
        'AyLbqLqpU',
        '1991-03-29',
        'emedcalfed@sphinn.com',
        '4268987741',
        '678 Clemons Park'
    ),
    (
        'Sapphire Gaythorpe',
        'GgG9H7OY8',
        '2002-05-15',
        'sgaythorpee@constantcontact.com',
        '6913388878',
        '04 Summit Point'
    ),
    (
        'Rafaellle Lusted',
        'Q0q0yz',
        '1992-02-10',
        'rlustedf@skype.com',
        '7816790333',
        '66 Briar Crest Road'
    ),
    (
        'Libbie Diddams',
        'F16AlHxF',
        '2005-10-12',
        'ldiddamsg@cocolog-nifty.com',
        '4151708201',
        '72 Holmberg Trail'
    ),
    (
        'Elka Kryszkiecicz',
        'O2MK4xw8NJOO',
        '1994-09-09',
        'ekryszkieciczh@mac.com',
        '2728150082',
        '2 Mcguire Terrace'
    ),
    (
        'Ailina Sandeford',
        'C6jtmhBhI3',
        '1994-03-26',
        'asandefordi@wordpress.com',
        '5778440131',
        '61248 American Ash Road'
    ),
    (
        'Loleta Vel',
        'g7GPwTAH',
        '1997-02-03',
        'lvelj@imgur.com',
        '9467664628',
        '2 Crownhardt Park'
    ),
    (
        'Joe Riall',
        'VGKl7wj',
        '1999-06-25',
        'jriallk@sun.com',
        '8353592791',
        '96533 Towne Place'
    ),
    (
        'Ashley McArley',
        'GJadrMWd0nnU',
        '1997-12-12',
        'amcarleyl@storify.com',
        '6594200043',
        '2964 Coleman Road'
    ),
    (
        'Dael Kilpin',
        '21S7UFHx4uEG',
        '1996-12-22',
        'dkilpinm@list-manage.com',
        '7809076068',
        '426 Crest Line Lane'
    ),
    (
        'Rolfe Cadany',
        'vC6DEftZB',
        '1991-08-19',
        'rcadanyn@deliciousdays.com',
        '1436879722',
        '949 Waubesa Trail'
    ),
    (
        'Carla Chick',
        'i2BAhJE6Lvl',
        '1992-10-01',
        'cchicko@walmart.com',
        '2859048112',
        '53 Packers Road'
    ),
    (
        'Dahlia Cuckson',
        'Vyvuzj44r',
        '1991-10-17',
        'dcucksonp@cisco.com',
        '5019925337',
        '83027 Stone Corner Road'
    ),
    (
        'Trevar McDonough',
        'DAPVunlon7',
        '1995-12-18',
        'tmcdonoughq@rakuname.co.jp',
        '9228070110',
        '23 Sunbrook Circle'
    ),
    (
        'Miller Tucknott',
        '8kl7A4Kff5n',
        '1995-04-20',
        'mtucknottr@tinyurl.com',
        '9435073942',
        '1 Burrows Hill'
    ),
    (
        'Ban Mundwell',
        'X40Ls6e6',
        '1994-04-10',
        'bmundwells@ucla.edu',
        '2993478142',
        '35 Bultman Avenue'
    ),
    (
        'Margarette Courage',
        'VL7hQjO6zc07',
        '1997-07-20',
        'mcouraget@si.edu',
        '2597222947',
        '5695 Pawling Center'
    );

insert into
    payment_card (user_id, name_of_bank, card_number)
values
    (1, 'Wordtune', 37662638),
    (2, 'Yakidoo', 93374857),
    (3, 'Youtags', 43646599),
    (4, 'Dabjam', 38258231),
    (5, 'Mynte', 48145127),
    (6, 'Voolia', 67042468),
    (7, 'Dazzlesphere', 53778086),
    (8, 'Browsedrive', 52594540),
    (9, 'Centidel', 20958466),
    (10, 'Yambee', 89124320),
    (11, 'Babbleset', 60817203),
    (12, 'Fanoodle', 43514983),
    (13, 'Quimba', 72305996),
    (14, 'Jamia', 99036238),
    (15, 'Mydo', 32942693),
    (16, 'Zooveo', 27092350),
    (17, 'Bluejam', 30232803),
    (18, 'Twinder', 53581448),
    (19, 'Jabberbean', 67669303),
    (20, 'Realbuzz', 37410651),
    (21, 'Tazzy', 13394572),
    (22, 'Demimbu', 10652307),
    (23, 'Yoveo', 95301812),
    (24, 'Yodoo', 68639207),
    (25, 'Rhynyx', 34258954),
    (26, 'Voonte', 41373262),
    (27, 'Centizu', 75292624),
    (28, 'Dabjam', 85271395),
    (29, 'Vidoo', 39714227),
    (30, 'Meemm', 46208174);

insert into
    orders (user_id, product_id, number)
values
    (1, 1, 5),
    (2, 2, 4),
    (3, 3, 7),
    (4, 4, 2),
    (5, 5, 2),
    (6, 6, 7),
    (7, 7, 3),
    (8, 8, 3),
    (9, 9, 4),
    (10, 10, 5),
    (11, 11, 7),
    (12, 12, 6),
    (13, 13, 8),
    (14, 14, 6),
    (15, 15, 5),
    (16, 16, 1),
    (17, 17, 9),
    (18, 18, 4),
    (19, 19, 5),
    (20, 20, 5),
    (21, 21, 10),
    (22, 22, 1),
    (23, 23, 2),
    (24, 24, 3),
    (25, 25, 6),
    (26, 26, 10),
    (27, 27, 1),
    (28, 28, 5),
    (29, 29, 6),
    (30, 30, 7);

insert into
    payments (order_id, payment_id, total, status)
values
    (1, 1, 25892367, 0),
    (2, 2, 94029461, 0),
    (3, 3, 46727187, 1),
    (4, 4, 24952107, 0),
    (5, 5, 97255032, 1),
    (6, 6, 61845488, 0),
    (7, 7, 97311362, 1),
    (8, 8, 82542301, 0),
    (9, 9, 52001495, 0),
    (10, 10, 43698048, 0),
    (11, 11, 19819417, 1),
    (12, 12, 7550709, 1),
    (13, 13, 2576453, 1),
    (14, 14, 92446722, 1),
    (15, 15, 61586184, 1),
    (16, 16, 43407247, 0),
    (17, 17, 21727379, 1),
    (18, 18, 56507420, 1),
    (19, 19, 10268562, 1),
    (20, 20, 46335969, 0),
    (21, 21, 46226347, 1),
    (22, 22, 48226944, 1),
    (23, 23, 8371921, 1),
    (24, 24, 16844411, 0),
    (25, 25, 47747193, 0),
    (26, 26, 97279042, 0),
    (27, 27, 62895160, 0),
    (28, 28, 55622847, 1),
    (29, 29, 10526536, 0),
    (30, 30, 85837255, 1);

ALTER TABLE users
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE products
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE orders
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE inventories
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE payment_card
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE payments
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SET SQL_SAFE_UPDATES = 0;

update inventories
set number = ( select sum(number) from products where type = '0')
where inventories.type = '0';

update inventories
set number = (select sum(number) from products where type = '1')
where inventories.type = '1';



delimiter //
create trigger after_add_order
after insert on orders
for each row 
begin
insert into payments (order_id, total, status)
values (new.order_id, 
new.number *(select price from products where products.product_id = new.product_id),
0);

update products
set products.number = number - new.number
where number >= new.number and products.product_id = new.product_id;
update inventories 
set number = number - new.number
where number >= new.number and
inventories.type = (select type from products where product_id = new.product_id);
end;
//


delimiter //
create trigger before_add_order
before insert on orders
for each row 
begin
if new.number > (select number from products where product_id = new.product_id) then
    signal sqlstate '45000' set message_text="error message";
    end if;
end;
//


delimiter //
create trigger after_add_product 
after insert on products
for each row
update inventories
set number = number + new.number
where inventories.type = new.type;
//