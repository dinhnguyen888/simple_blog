<script lang="ts">
	// Profile information
	const profile = {
		name: 'Your Name',
		title: 'Web Developer',
		description:
			"I'm a passionate web developer with expertise in Svelte and TypeScript. Welcome to my portfolio where I showcase my projects and skills.",
		skills: ['Svelte', 'TypeScript', 'JavaScript', 'CSS', 'HTML', 'Node.js']
	};
</script>

<svelte:head>
	<title>{profile.name} - Portfolio</title>
	<meta name="description" content="Personal portfolio of {profile.name}" />
</svelte:head>

<section class="hero">
	<h1>Hi, I'm <span class="highlight">{profile.name}</span></h1>
	<h2>{profile.title}</h2>
	<p>{profile.description}</p>

	<h3>My Skills</h3>
	<ul>
		{#each profile.skills as skill}
			<li>{skill}</li>
		{/each}
	</ul>

	<nav class="cta">
		<a href="/projects" class="btn primary">See My Work</a>
		<a href="/contact" class="btn secondary">Contact Me</a>
	</nav>

	<img src="/profile-image.jpg" alt={profile.name} />
</section>
