tag GiphySearcher

	prop query default: ""
	prop apiKey default: "sXLcqvSTNNIrGaufrME9Eeap5tY2Jka6"

	def setup
		@images = ["https://media.giphy.com/media/13gvXfEVlxQjDO/giphy.gif"]
		await search()

	def search
		const q = query.trim
		
		console.log "q:length -> "
		if q:length < 3
			return
		
		const api = "https://api.giphy.com/v1/gifs/search?q={q}&api_key={apiKey}"		
		const data = await window.fetch(api)
		const j = await data.json()
		const entries = []
		for image in j:data
			entries.push(image:images:original:url)
		@images = entries
			
	def render
		<self>
			<header>
				<h1> "Giphy Searcher"
			<div.main>
				<div.searchbar>
					<input.search[query] :keydown.search placeholder="Please enter, atleast three characters to search">
				<div.images>
					for i in @images
						<img src="{i}">						
				

Imba.mount <GiphySearcher>