<script>
	const currentYear = new Date().getFullYear();
	let currentTime = new Date().toLocaleTimeString();

	// Update the time every second
	setInterval(() => {
		currentTime = new Date().toLocaleTimeString();
	}, 1000);
</script>

<footer>
	<div class="container">
		<div class="clock">
			<p>{currentTime}</p>
		</div>
		<div class="social-links">
			<a href="https://github.com" target="_blank" rel="noopener noreferrer">GitHub</a>
			<a href="https://linkedin.com" target="_blank" rel="noopener noreferrer">LinkedIn</a>
			<a href="https://facebook.com" target="_blank" rel="noopener noreferrer">Facebook</a>
			<a href="https://zalo.me" target="_blank" rel="noopener noreferrer">Zalo</a>
		</div>
	</div>
</footer>

<style>
	footer {
		background-color: #222;
		color: white;
		padding: 2rem 0;
		margin-top: 3rem;
	}

	.container {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 1rem;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
		align-items: center;
		gap: 1.5rem;
	}

	.social-links {
		display: flex;
		gap: 1.5rem;
		flex-wrap: wrap;
		justify-content: center;
	}

	.social-links a {
		color: #ccc;
		text-decoration: none;
		transition: color 0.3s;
		position: relative;
	}

	.social-links a::after {
		content: '';
		position: absolute;
		width: 0;
		height: 2px;
		bottom: -3px;
		left: 0;
		background-color: #fff;
		transition: width 0.3s ease;
	}

	.social-links a:hover::after {
		width: 100%;
	}

	.social-links a:hover {
		color: #fff;
	}

	.copyright {
		font-size: 0.9rem;
		color: #999;
		width: 100%;
		text-align: center;
		margin-top: 1rem;
	}

	.clock {
		background-color: #333;
		padding: 0.5rem 1rem;
		border-radius: 4px;
		font-size: 1.2rem;
		font-weight: bold;
		color: #00ff00;
	}

	@media (max-width: 768px) {
		.container {
			flex-direction: column;
			text-align: center;
		}

		.clock {
			margin-bottom: 1rem;
		}
	}

	@media (min-width: 769px) and (max-width: 1024px) {
		.container {
			justify-content: space-around;
		}
	}
</style>
